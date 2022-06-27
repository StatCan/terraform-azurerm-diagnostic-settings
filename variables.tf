
variable "target_resource_id" {
    type        = string
    description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
}

variable "diagnostics_entry_name" {
    type        = string
    default     = null
    description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
}

variable "metrics" {
    type        = list(string)
    default     = ["all"]
    description = "A list of the metric categories to configure for this resource"
}

variable "logs" {
    type        = list(string)
    default     = ["all"]
    description = "A list of the log categories to configure for this resource"
}

variable "log_analytics_workspace_id" {
    type        = string
    default     = null
    description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent"
}

variable "storage_account_id" {
    type    = string
    default = null
    description = "Specifies the ID of a Storage Account where Diagnostics Data should be sent"
}

variable "eventhub" {
    type    = object({
        eventhub_authorization_rule_id = string
        eventhub_name                  = string
    })
    default     = null
    description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data & the Event Hub where Diagnostics Data should be sent."
}

variable "retention_policy_days" {
    type        = number
    default     = 90
    description = "The number of days for which this Retention Policy should apply."
}
