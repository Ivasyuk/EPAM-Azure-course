resource_groups = {
  rg1 = {
    name     = "cmaz-efe625c7-mod5-rg-01"
    location = "East US"
    tags     = { Creator = "ruslan_ivasiuk@epam.com" }
  },
  rg2 = {
    name     = "cmaz-efe625c7-mod5-rg-02"
    location = "West US"
    tags     = { Creator = "ruslan_ivasiuk@epam.com" }
  },
  rg3 = {
    name     = "cmaz-efe625c7-mod5-rg-03"
    location = "Central US"
    tags     = { Creator = "ruslan_ivasiuk@epam.com" }
  }
}

app_service_plans = {
  asp1 = {
    name                = "cmaz-efe625c7-mod5-asp-01"
    location            = "East US"
    resource_group_name = "rg1"
    sku_tier            = "Standart"
    sku_size            = "P0v3"
    tags                = { "Creator" = "ruslan_ivasiuk@epam.com" }
  }
  asp2 = {
    name                = "cmaz-efe625c7-mod5-asp-02"
    location            = "West US"
    resource_group_name = "rg2"
    sku_tier            = "Standart"
    sku_size            = "P1v3"
    tags                = { "Creator" = "ruslan_ivasiuk@epam.com" }
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-efe625c7-mod5-app-01"
    location             = "East US"
    resource_group_name  = "rg1"
    app_service_plan_id  = "asp1"
    tags                 = { "Creator" = "ruslan_ivasiuk@epam.com" }
  }
  app2 = {
    name                 = "cmaz-efe625c7-mod5-app-02"
    location             = "West US"
    resource_group_name  = "rg2"
    app_service_plan_id  = "asp2"
    tags                 = { "Creator" = "ruslan_ivasiuk@epam.com" }
  }
}

tm_profile_name    = "cmaz-efe625c7-mod5-traf"
tm_routing_method  = "Performance"
allow_ip_rule_name = "allow-ip"
allow_tm_rule_name = "allow-tm"
verification_agent_ip = "18.153.146.156"
