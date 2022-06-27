data "azurerm_monitor_diagnostic_categories" "this" {
  resource_id = var.target_resource_id
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                           = var.diagnostics_entry_name
  target_resource_id             = var.target_resource_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  eventhub_authorization_rule_id = var.eventhub.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub.eventhub_name
  storage_account_id             = var.storage_account_id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.postgresql_server[0].logs

    content {
      category = log.value
      enabled  = contains(var.logs, "all") || contains(var.logs, log.value)

      retention_policy {
        enabled = true
        days    = var.retention_policy_days
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.postgresql_server[0].metrics

    content {
      category = metric.value
      enabled  = contains(var.metrics, "all") || contains(var.metrics, metric.value)

      retention_policy {
        enabled = true
        days    = var.retention_policy_days
      }
    }
  }
}
