data "archive_file" "application_archive" {
  type        = "tar.gz"
  source_dir  = var.source_content_path                   
  output_path = "${path.module}/${var.storage_blob_name}" 
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "app_content" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "app_archive_blob" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.app_content.name
  type                   = "Block"
  source                 = data.archive_file.application_archive.output_path 
}
