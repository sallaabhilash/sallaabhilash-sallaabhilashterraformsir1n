terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "devstorage01234"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}