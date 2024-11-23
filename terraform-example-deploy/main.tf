terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.116.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
  }
  backend "azurerm" {
    key      = "terraform.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  use_oidc                   = true
  skip_provider_registration = true
  features {}
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}


module "create-virtual-machine" {

  source              = "git::https://github.com/praveenambati1233/virtual-machine@main"
  resource_group_name = "ambati-20241118-dev"
}