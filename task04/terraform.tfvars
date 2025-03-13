location = "East US"

vm_admin_username = "azureuser"

# Set this manually or provide it during `terraform apply`


resource_group_name  = "cmaz-efe625c7-mod4-rg"
vnet_name            = "cmaz-efe625c7-mod4-vnet"
subnet_name          = "frontend"
nsg_name             = "cmaz-efe625c7-mod4-nsg"
nic_name             = "cmaz-efe625c7-mod4-nic"
public_ip_name       = "cmaz-efe625c7-mod4-pip"
dns_label            = "cmaz-efe625c7-mod4-nginx"
vm_name              = "cmaz-efe625c7-mod4-vm"
vm_size              = "Standard_F2s_v2"
allow_http_rule_name = "AllowHTTP"

tags = {
  Creator = "ruslan_ivasiuk@epam.com"
}

