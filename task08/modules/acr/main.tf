resource "azurerm_container_registry" "acr" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.sku
  admin_enabled       = true
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build" {
  name                  = "build-task"
  container_registry_id = azurerm_container_registry.acr.id
  enabled               = true
  timeout_in_seconds    = 3600
  is_system_task        = false
  tags                  = var.tags

  platform {
    os = "Linux"
  }

  docker_step {
    context_path         = "https://github.com/Ivasyuk/EPAM-Azure-course#main:task08/"
    dockerfile_path      = "application/Dockerfile"
    image_names          = [var.image_name]
    push_enabled         = true
    cache_enabled        = true
    context_access_token = var.git_pat
  }
}

resource "azurerm_container_registry_task_schedule" "acr" {
  name                       = "${var.name}-task-schedule"
  container_registry_task_id = azurerm_container_registry_task.build.id
  schedule                   = "0 */1 * * *" # every 1 hour
  enabled                    = true
}
