output "alert_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/monitoring/conditions"
  description = "Monitoring Conditons URL"
}