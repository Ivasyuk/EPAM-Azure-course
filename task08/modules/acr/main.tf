resource "azurerm_container_registry" "task08_acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku_name
}

resource "azurerm_container_registry_task" "task08_acr_task" {
  name                  = "build-task"
  container_registry_id = azurerm_container_registry.task08_acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = "https://github.com/Ivasyuk/EPAM-Azure-course#main:"
    context_access_token = "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"
    image_names          = ["ruslantask08test"]
  }
}
resource "azurerm_container_registry_task_schedule_run_now" "task08_acr_task_schedule" {
  container_registry_task_id = azurerm_container_registry_task.task08_acr_task.id
}
