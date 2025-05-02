#before run 


terraform apply -target=azurerm_resource_group.my_rg -auto-approve 


# Set variables
RG_NAME="epam-task07-rg"
STORAGE_ACCOUNT_NAME="ruslanivasiukepamtask07" 
LOCATION="West US"

# Create Storage Account
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RG_NAME \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2
 
 # Import Storage Account
 terraform import azurerm_storage_account.my_storage /subscriptions/027e47ba-3a0e-415b-8eed-790642b9dd0e/resourceGroups/epam-task07-rg/providers/Microsoft.Storage/storageAccounts/ruslanivasiukepamtask07
