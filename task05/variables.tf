variable "rg1_name" {
  description = "Name of the first resource group"
  type        = string
}

variable "rg1_location" {
  description = "Location of the first resource group"
  type        = string
}

variable "rg2_name" {
  description = "Name of the second resource group"
  type        = string
}

variable "rg2_location" {
  description = "Location of the second resource group"
  type        = string
}

variable "rg3_name" {
  description = "Name of the third resource group"
  type        = string
}

variable "rg3_location" {
  description = "Location of the third resource group"
  type        = string
}

variable "creator_tag" {
  description = "Creator tag for resources"
  type        = string
}

variable "asp1_name" {
  description = "Name of the first App Service Plan"
  type        = string
}

variable "asp1_location" {
  description = "Location of the first App Service Plan"
  type        = string
}

variable "asp1_sku_tier" {
  description = "SKU tier for the first App Service Plan"
  type        = string
}

variable "asp1_sku_size" {
  description = "SKU size for the first App Service Plan"
  type        = string
}

variable "asp2_name" {
  description = "Name of the second App Service Plan"
  type        = string
}

variable "asp2_location" {
  description = "Location of the second App Service Plan"
  type        = string
}

variable "asp2_sku_tier" {
  description = "SKU tier for the second App Service Plan"
  type        = string
}

variable "asp2_sku_size" {
  description = "SKU size for the second App Service Plan"
  type        = string
}

variable "app1_name" {
  description = "Name of the first App Service"
  type        = string
}

variable "app1_location" {
  description = "Location of the first App Service"
  type        = string
}

variable "app2_name" {
  description = "Name of the second App Service"
  type        = string
}

variable "app2_location" {
  description = "Location of the second App Service"
  type        = string
}

variable "tm_name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "tm_location" {
  description = "Location of the Traffic Manager profile"
  type        = string
}

variable "tm_dns_name" {
  description = "DNS name of the Traffic Manager profile"
  type        = string
}

variable "tm_endpoints" {
  description = "Endpoints for the Traffic Manager profile"
  type        = list(object({
    name            = string
    location        = string
    app_service_id  = string
  }))
}

variable "verification_agent_ip" {
  description = "IP of the verification agent"
  type        = string
}
