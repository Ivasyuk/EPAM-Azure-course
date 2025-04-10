
resource "azurerm_storage_account" "my_storage" {
  name                     = "ruslanivasiukepamtask07"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


# Create a container in the storage account
resource "azurerm_storage_container" "data_container" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.my_storage.id
  container_access_type = "private"  # Options: private, blob, container
}

# Upload a sample text file to the container
resource "azurerm_storage_blob" "my_file" {
  name                   = "lviv.jpg"
  storage_account_name = azurerm_storage_account.my_storage.name
  storage_container_name = azurerm_storage_container.data_container.name
  type                  = "Block"
  source                = "${path.module}/files/lviv.jpg"  # Local path to your file
}