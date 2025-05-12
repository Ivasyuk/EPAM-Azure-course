resource "azurerm_container_registry" "task08_acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku_name
  admin_enabled                 = false
  public_network_access_enabled = true
}

resource "azurerm_container_registry_task" "task08_acr_task" {
  name                  = "build-task"
  container_registry_id = azurerm_container_registry.task08_acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.context_path 
    context_access_token = var.git_pat
    image_names          = var.image_names
  }
}
resource "azurerm_container_registry_task_schedule_run_now" "task08_acr_task_schedule" {
  container_registry_task_id = azurerm_container_registry_task.task08_acr_task.id
}
