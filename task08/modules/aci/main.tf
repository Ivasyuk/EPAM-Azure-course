resource "azurerm_container_group" "container" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy

  container {
    name   = var.container_name
    image  = "${var.acr_login_server}/${var.image_name}:latest"
    cpu    = var.cpu
    memory = var.memory
    ports {
      port     = var.port
      protocol = "TCP"
    }
    environment_variables = {
      CREATOR         = "ACI"
      REDIS_PORT      = "6380"
      REDIS_SSL_MODE  = "True"
    }
  }

}