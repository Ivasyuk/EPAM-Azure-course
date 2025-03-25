resource_groups = {
  rg_eus = {
    name     = "cmaz-efe625c7-mod5-rg-01"
    location = "Canada Central"
  },
  rg_wus = {
    name     = "cmaz-efe625c7-mod5-rg-02"
    location = "Canada East"
  },
  rg_cus = {
    name     = "cmaz-efe625c7-mod5-rg-03"
    location = "Central US"
  }
}

tags = {
  Creator = "ruslan_ivasiuk@epam.com"
}

# Traffic Manager
traffic_manager = {
  profile_name           = "cmaz-efe625c7-mod5-traf"
  rg_key                 = "rg_cus"
  traffic_routing_method = "Performance"
}

# Map of Webapps
webapps = {
  "webapp_eus" = {
    service_plan_props = {
      name         = "cmaz-efe625c7-mod5-asp-01"
      os_type      = "Windows"
      sku_name     = "P0v3"
      worker_count = 2
    }
    webapp_name = "cmaz-efe625c7-mod5-app-01"
    rg_key      = "rg_eus"
  }
  "webapp_wus" = {
    service_plan_props = {
      name         = "cmaz-efe625c7-mod5-asp-02"
      os_type      = "Windows"
      sku_name     = "P1v3"
      worker_count = 1
    }
    webapp_name = "cmaz-efe625c7-mod5-app-02"
    rg_key      = "rg_wus"
  }
}

# Map of App Service IP restrictions
webapp_ip_restrictions = {
  "allow-ip" = {
    action      = "Allow"
    ip_address  = "18.153.146.156/32" # Allowed IP address
    priority    = 1100
    description = "Allow agent IP"
  }
  "allow-tm" = {
    action      = "Allow"
    service_tag = "AzureTrafficManager"
    priority    = 1000
    description = "TAG restriction - Allow AzureTrafficManager"
  }
}
