variable "app_services" {
  description = "Map of app services to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    app_service_plan_id = string
    tags                = map(string)
  }))
}

variable "verification_agent_ip" {
  description = "Verification agent IP address"
  type        = string
}
