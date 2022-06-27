output "diagnostic_setting_id" {
  value       = azurerm_monitor_diagnostic_setting.this.id
  type        = string
  description = "The ID of the Diagnostic Setting."
}

output "logs" {
  value       = azurerm_monitor_diagnostic_categories.this.logs
  type        = list(string)
  description = "A list of the Log Categories supported for this Resource."
}

output "metrics" {
  value       = azurerm_monitor_diagnostic_categories.this.metrics
  type        = string
  description = "A list of the Metric Categories supported for this Resource."
}

output "target_resource_id" {
  value       = azurerm_monitor_diagnostic_categories.this.id
  type        = string
  description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
}
