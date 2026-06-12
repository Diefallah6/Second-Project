terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg-diefallah"
    storage_account_name = "tfstate4808diefallah"
    container_name       = "tfstate"
    key                  = "second-project.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}