##################################################################################
# TERRAFORM CONFIG
##################################################################################
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 2.0"
        }
    }
    backend "azurerm" {
        key = "app.terraform.tfstate"
    }
}


##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
