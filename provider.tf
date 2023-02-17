terraform {

   required_version = ">=0.12"
 }

provider "azurerm" {
   features {}
 }
resource "azurerm_resource_group" "rsGroup" {
   name     = "acctestrg"
   location = "West US 2"
 }