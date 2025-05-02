resource "azurerm_recovery_services_vault" "my_rsv" {
  name                = "my-recovery-vault"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  sku                 = "Standard"
  storage_mode_type   = "LocallyRedundant"
}
resource "azurerm_backup_policy_vm" "my_backup_policy" {
  name                = "my-backup-policy"
  resource_group_name = azurerm_resource_group.my_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.my_rsv.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 10
  }
}

resource "azurerm_backup_protected_vm" "my_backup_vm" {
  resource_group_name = azurerm_resource_group.my_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.my_rsv.name
  source_vm_id        = azurerm_linux_virtual_machine.my_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.my_backup_policy.id
}
