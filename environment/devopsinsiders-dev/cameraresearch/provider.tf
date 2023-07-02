terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.19.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devopsinsiders-storage-accounts"
    storage_account_name = "devopsinsiders"
    container_name       = "terraform"
    key                  = "cameraresearch01/terraform.tfstate"
  }
}


