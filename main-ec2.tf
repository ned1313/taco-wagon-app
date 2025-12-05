# EC2 Resources and Autoscaling Policies

data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

module "web_front_end" {
  source = "./modules/web-front-end"

  app_port                = var.app_port
  autoscale_group_size    = var.autoscale_group_size
  autoscale_group_min_max = var.autoscale_group_min_max
  environment             = var.environment
  instance_tags = {
    Environment = var.environment
  }
  instance_type       = var.instance_type
  launch_template_ami = data.aws_ssm_parameter.amzn2_linux.value
  prefix              = var.prefix
  public_subnet_ids   = module.vpc.public_subnets
  vpc_id              = module.vpc.vpc_id
  user_data_contents = base64encode(templatefile("./templates/startup_script.tpl", {
    environment = var.environment
  }))

}

# Autoscaling Policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.prefix}-${var.environment}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = module.web_front_end.autoscaling_group_name
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.prefix}-${var.environment}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = module.web_front_end.autoscaling_group_name
  policy_type            = "SimpleScaling"
}

# CloudWatch Alarms
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.prefix}-${var.environment}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "75"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = module.web_front_end.autoscaling_group_name
  }

  tags = {
    Name        = "${var.prefix}-${var.environment}-cpu-high-alarm"
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.prefix}-${var.environment}-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = module.web_front_end.autoscaling_group_name
  }

  tags = {
    Name        = "${var.prefix}-${var.environment}-cpu-low-alarm"
    Environment = var.environment
  }
}
