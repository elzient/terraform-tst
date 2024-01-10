terraform {
  required_version = "= 1.4.7"
  required_providers {
    
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.66.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.39.0"
    }
  }
  backend "azurerm" {
  } 
}

provider "azurerm" {

  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    key_vault {
      purge_soft_delete_on_destroy = false
      recover_soft_deleted_key_vaults = true
    }
  }
}


resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location

} 

output "location" {
  value = azurerm_resource_group.rg.location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_id" {
  value = azurerm_resource_group.rg.id
}
