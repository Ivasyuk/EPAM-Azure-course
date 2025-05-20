
tags = {
  Creator = "ruslan_ivasiuk@epam.com"
}
location        = "West Europe"
name_prefix     = "cmtr-efe625c7-mod8"
git_repo_url    = "https://github.com/Ivasyuk/EPAM-Azure-course.git"
git_repo_branch = "main"
image_repo_name = "cmtr-efe625c7-mod8-app"
acr_sku         = "Standard"
redis_sku       = "Basic"
redis_family    = "C"
redis_capacity  = 2
node_count      = 1
node_vm_size    = "Standard_D2ads_v5"
key_vault_sku   = "standard"
aks_node_pool_name = "system"
aks_node_count = 1
aks_vm_size = "Standard_D2ads_v5"
aks_os_disk_type = "Ephemeral"
default_node_pool_os_disk_size_gb = 60
