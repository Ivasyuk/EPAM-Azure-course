variable "name" {
  description = "The name of the Traffic Manager Profile"
  type        = string
}

variable "relative_name" {
  description = "The name of the Traffic Manager Profile"
  type        = string
}


variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "location" {
  description = "The location of the Traffic Manager Profile"
  type        = string
}

variable "routing_method" {
  description = "Traffic Manager routing method"
  type        = string
}

variable "endpoints" {
  description = "The endpoints for Traffic Manager"
  type        = map(string)
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager Profile"
  type        = map(string)
}

variable "monitor_protocol" {
  description = "The protocol used for the Traffic Manager health check"
  type        = string
  default     = "HTTP"  # You can set default to "HTTPS" or other protocols if needed
}

variable "monitor_port" {
  description = "The port used for the Traffic Manager health check"
  type        = number
  default     = 80  # Default port for HTTP. Change to 443 if using HTTPS.
}

variable "monitor_path" {
  description = "The path used for the Traffic Manager health check"
  type        = string
  default     = "/health"  # Set a health check path for the app, can be customized
}
