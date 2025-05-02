# Create CDN Profile
resource "azurerm_cdn_profile" "cdn_profile" {
  name                = "epam-task07-cdn-profile"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_Microsoft"

  tags = {
    environment = "task07"
  }
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                          = "epam-task07-cdn-endpoint"
  profile_name                  = azurerm_cdn_profile.cdn_profile.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  is_http_allowed               = true
  is_https_allowed              = true
  querystring_caching_behaviour = "IgnoreQueryString"
  is_compression_enabled        = true
  origin_host_header            = azurerm_storage_account.my_storage.primary_blob_host

  origin {
    name      = "storage-origin"
    host_name = azurerm_storage_account.my_storage.primary_blob_host

  }
  content_types_to_compress = [
    "files/jpeg",
  ]

  # Optional: Add custom domain later if needed
  # custom_domain {
  #   name = "cdn.yourdomain.com"
  # }

  tags = {
    environment = "task07"
  }
}
