resource_group_name = "cmtr-efe625c7-mod8-rg"
location            = "West US 2"
tags = {
  Creator = "ruslan_ivasiuk@epam.com"
}
name_prefix    = "cmtr-efe625c7-mod8"
name_prefix_cr = "cmtrefe625c7mod8"

# AKS Node Pool setup (customize if needed)
aks_node_pool_node_count   = 3
aks_node_pool_vm_size      = "Standard_DS2_v2"
aks_node_pool_os_disk_type = "Managed"
aks_node_pool_name         = "default"
aks_dns_prefix             = "aks-cluster" # Prefix used in DNS for AKS
