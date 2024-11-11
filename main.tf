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
     use_oidc = true
      
    }
}

#4. terraform Resource BLOCK ?: define a random Pet
resource "random_pet" "aksrandom" {
  
}
