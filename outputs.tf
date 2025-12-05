output "public_nlb_dns" {
  description = "Public DNS of the LB."
  value       = module.web_front_end.lb_public_dns
}