output "alert_url" {
  value       = module.lightstep_ec2_alerts.alerts_url
  description = "Alerts URL"
}
