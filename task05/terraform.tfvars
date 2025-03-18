rg1_name        = "cmaz-efe625c7-mod5-rg-01"
rg1_location    = "East US"
rg2_name        = "cmaz-efe625c7-mod5-rg-02"
rg2_location    = "West US"
rg3_name        = "cmaz-efe625c7-mod5-rg-03"
rg3_location    = "Central US"

creator_tag     = "ruslan_ivasiuk@epam.com"

asp1_name       = "cmaz-efe625c7-mod5-asp-01"
asp1_location   = "East US"
asp1_sku_tier   = "PremiumV3"
asp1_sku_size   = "P0v3"

asp2_name       = "cmaz-efe625c7-mod5-asp-02"
asp2_location   = "West US"
asp2_sku_tier   = "PremiumV3"
asp2_sku_size   = "P1v3"

app1_name       = "cmaz-efe625c7-mod5-app-01"
app1_location   = "East US"
app2_name       = "cmaz-efe625c7-mod5-app-02"
app2_location   = "West US"

tm_name         = "cmaz-efe625c7-mod5-traf"
tm_location     = "Central US"
tm_dns_name     = "traf.example.com"
tm_endpoints    = [
  {
    name           = "app1-endpoint"
    location       = "East US"
    app_service_id = "app1-id"
  },
  {
    name           = "app2-endpoint"
    location       = "West US"
    app_service_id = "app2-id"
  }
]

verification_agent_ip = "18.153.146.156"
