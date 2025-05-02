# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/networkInterfaces/restoredvm-nic-30f544eac003408f942774d6e844450b"
resource "azurerm_network_interface" "restored_vm_nic" {
  accelerated_networking_enabled = false
  auxiliary_mode                 = null
  auxiliary_sku                  = null
  dns_servers                    = []
  edge_zone                      = null
  internal_dns_name_label        = null
  ip_forwarding_enabled          = false
  location                       = "westus"
  name                           = "restoredvm-nic-30f544eac003408f942774d6e844450b"
  resource_group_name            = "epam-task07-rg"
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = null
    name                                               = "3c34e7499a8c4d099cb550963f10a744"
    primary                                            = true
    private_ip_address                                 = "10.0.1.5"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/publicIPAddresses/restoredvm-pip-af1baa736576443caf77bff0f3dfd092"
    subnet_id                                          = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"
  }
}

# __generated__ by Terraform from "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/publicIPAddresses/restoredvm-pip-af1baa736576443caf77bff0f3dfd092"
resource "azurerm_public_ip" "restored_vm_pip" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  ddos_protection_plan_id = null
  domain_name_label       = null
  domain_name_label_scope = null
  edge_zone               = null
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westus"
  name                    = "restoredvm-pip-af1baa736576443caf77bff0f3dfd092"
  public_ip_prefix_id     = null
  resource_group_name     = "epam-task07-rg"
  reverse_fqdn            = null
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
}

# __generated__ by Terraform from "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Compute/virtualMachines/restoredvm"
resource "azurerm_virtual_machine" "restored_vm" {
  availability_set_id              = null
  delete_data_disks_on_termination = null
  delete_os_disk_on_termination    = null
  license_type                     = null
  location                         = "westus"
  name                             = "restoredvm"
  network_interface_ids            = ["/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/networkInterfaces/restoredvm-nic-30f544eac003408f942774d6e844450b"]
  primary_network_interface_id     = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/networkInterfaces/restoredvm-nic-30f544eac003408f942774d6e844450b"
  proximity_placement_group_id     = null
  resource_group_name              = "epam-task07-rg"
  tags                             = {}
  vm_size                          = "Standard_DS1_v2"
  zones                            = []
  storage_os_disk {
    caching                   = "ReadWrite"
    create_option             = "Attach"
    disk_size_gb              = 30
    image_uri                 = null
    managed_disk_id           = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Compute/disks/restoredvm-osdisk-20250502-083153"
    managed_disk_type         = "Standard_LRS"
    name                      = "restoredvm-osdisk-20250502-083153"
    os_type                   = "Linux"
    vhd_uri                   = null
    write_accelerator_enabled = false
  }
}
