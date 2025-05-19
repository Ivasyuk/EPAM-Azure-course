resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    os_disk_size_gb = 30
    os_disk_type    = "Ephemeral"
  }

  identity {
    type = "SystemAssigned"
  }

  workload_identity_enabled = true

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_key_vault_access_policy" "aks_kv_access" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id

  secret_permissions = [
    "Get"
  ]
}

output "kube_config" {
  description = "AKS kube_config block"
  value = {
    host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
    client_key             = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
    cluster_ca_certificate = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
    username               = azurerm_kubernetes_cluster.aks.kube_config[0].username
    password               = azurerm_kubernetes_cluster.aks.kube_config[0].password
  }
}