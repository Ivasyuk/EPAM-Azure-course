import {
  id = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Compute/virtualMachines/restoredvm"
  to = azurerm_virtual_machine.restored_vm
}

import {
  id = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/networkInterfaces/restoredvm-nic-30f544eac003408f942774d6e844450b"
  to = azurerm_network_interface.restored_vm_nic
}

import {
  id = "/subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Network/publicIPAddresses/restoredvm-pip-af1baa736576443caf77bff0f3dfd092"
  to = azurerm_public_ip.restored_vm_pip
}

