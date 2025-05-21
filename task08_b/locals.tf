locals {
  name_prefix = var.name_prefix

  rg_name        = "${local.name_prefix}-rg"
  aci_redis_name = "${local.name_prefix}-redis-ci"
  sa_name        = replace("${local.name_prefix}sa", "-", "")
  keyvault_name  = "${local.name_prefix}-kv"
  acr_name       = replace("${local.name_prefix}cr", "-", "")
  aca_env_name   = "${local.name_prefix}-cae"
  aca_name       = "${local.name_prefix}-ca"
  aks_name       = "${local.name_prefix}-aks"

  common_tags = {
    Creator = var.creator
  }

  docker_image_name = "${local.name_prefix}-app"
  docker_image_tag  = "latest"

  storage_container_name = "app-content"
  storage_blob_name      = "app.tar.gz"

  redis_hostname_secret_name = "redis-hostname"
  redis_password_secret_name = "redis-password"
}
