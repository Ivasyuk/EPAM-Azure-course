# Variables
RESOURCE_GROUP_NAME="epam-task07-tfstate-rg"
LOCATION="West US"
STORAGE_ACCOUNT_NAME="epamtask07tfstate$(random -n 6)"  # Adding random suffix for uniqueness
CONTAINER_NAME="tfstate"

# Print the plan
echo "Planning to create:"
echo "Resource Group:   $RESOURCE_GROUP_NAME"
echo "Location:        $LOCATION"
echo "Storage Account: $STORAGE_ACCOUNT_NAME"
echo "Container:       $CONTAINER_NAME"

# Create Resource Group
echo "Creating Resource Group..."
az group create \
    --name "$RESOURCE_GROUP_NAME" \
    --location "$LOCATION" \
    --tags "Purpose=TerraformState" "Environment=Management"

# Create Storage Account
echo "Creating Storage Account..."
az storage account create \
    --name "$STORAGE_ACCOUNT_NAME" \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --location "$LOCATION" \
    --sku "Standard_LRS" \
    --kind "StorageV2" \
    --encryption-services blob \
    --min-tls-version "TLS1_2" \
    --allow-blob-public-access false \
    --tags "Purpose=TerraformState" "Environment=Management"

# Get Storage Account Key
echo "Getting Storage Account Key..."
ACCOUNT_KEY=$(az storage account keys list \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --query "[0].value" -o tsv)

# Create Container
echo "Creating Storage Container..."
az storage container create \
    --name "$CONTAINER_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --account-key "$ACCOUNT_KEY"

# Save the backend configuration
echo "Creating backend configuration file..."
cat > backend.tf << EOF
terraform {
  backend "azurerm" {
    resource_group_name  = "${RESOURCE_GROUP_NAME}"
    storage_account_name = "${STORAGE_ACCOUNT_NAME}"
    container_name       = "${CONTAINER_NAME}"
    key                 = "terraform.tfstate"
  }
}
EOF

export ARM_ACCESS_KEY=$ACCOUNT_KEY
