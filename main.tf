/* 
    1. Terraform setting block
    2. Required version terraform
    3. Required Terraform Provider
    4. Terraform Remote State  Storage
    5. terraform Provider Block FOR AzureRM
    4. terraform Resource BLOCK ?: define a random Pet
*/

# Setting block
terraform {
#Required Version
required_version = ">0.13"

#Required Terraform provider

required_providers {

azurerm = {
  source = "hashicorp/azurerm"
  version = "~> 4.0"
}
azuread = {
  source = "hashicorp/azuread"
  version = "~> 3.0"

}
random = {
  source = "hashicorp/random"
  version = "~> 3.6"
}
}
#Terraform Stage storage to AzurerRM storage container
backend "azurerm" {
  resource_group_name = "terraformRG"
  storage_account_name = "eyoberraformstorage"
  container_name = "tfstatefile"
  key = "customvnet.terraform.tfstate"
  
}
  
}

#5. terraform Provider Block FOR AzureRM
provider "azurerm" {
    features {
      
    }
    client_id       = "7dd2de5a-f69e-4cc9-80b7-04367b318d94"
    #client_secret   = var.client_secret
    tenant_id       = "837f24c8-eaf4-44ce-99db-bc07666bc961"
    subscription_id = "648dfb1f-869a-4ae6-8f5f-1f5d84c0fd45"

}

#4. terraform Resource BLOCK ?: define a random Pet
resource "random_pet" "aksrandom" {
  
}
