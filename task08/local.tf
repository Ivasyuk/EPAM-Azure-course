locals {
  rg_name           = "${var.name_prefix}-rg"
  acr_name          = "${var.name_prefix_cr}cr"
  aci_name          = "${var.name_prefix}-ci"
  redis_name        = "${var.name_prefix}-redis"
  docker_image_name = "${var.name_prefix}-app"
}