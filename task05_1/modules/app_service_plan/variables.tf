variable "app_service_plans" {
  description = "Map of App Service Plans to be created."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_tier            = string
    sku_size            = string
    tags                = map(string)
  }))
}
