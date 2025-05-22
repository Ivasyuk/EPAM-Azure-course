location                 = "eastus"
rg_name                  = "cmtr-efe625c7-mod9-rg"
vnet_name                = "cmtr-efe625c7-mod9-vnet"
vnet_address_space       = "10.0.0.0/16"
aks_subnet_address_space = "10.0.0.0/24"
aks_loadbalancer_ip      = "172.214.14.156" # Updated with correct IP from task parameters
subnet_name              = "aks-snet"
project_prefix           = "cmtr-efe625c7"