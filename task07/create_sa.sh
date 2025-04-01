# Set variables
RG_NAME="epam-task07-rg"
STORAGE_ACCOUNT_NAME="examplestorageaccttf01"  # must be globally unique
LOCATION="East US"

# Create Storage Account
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RG_NAME \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2
