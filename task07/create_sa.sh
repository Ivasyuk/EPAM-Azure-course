# Set variables
RG_NAME="epam-task07-rg"
STORAGE_ACCOUNT_NAME="ruslanivasiukepamtask07"  # must be globally unique
LOCATION="West US"


az group create --location $LOCATION --resource-group $RG_NAME

# Create Storage Account
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RG_NAME \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2
