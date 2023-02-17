resource "azurerm_virtual_network" "VPC" {
    name                = "acctvn"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rsGroup.location
    resource_group_name = azurerm_resource_group.rsGroup.name
}

resource "azurerm_subnet" "oursubnet" {
    name                 = "acctsub"
    resource_group_name  = azurerm_resource_group.rsGroup.name
    virtual_network_name = azurerm_virtual_network.VPC.name
    address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "publicIP" {
    name                         = "publicIP"
    location                     = azurerm_resource_group.rsGroup.location
    resource_group_name          = azurerm_resource_group.rsGroup.name
    allocation_method            = "Static"
}
 resource "azurerm_network_interface" "NI" {
   count               = 2
   name                = "acctni${count.index}"
   location            = azurerm_resource_group.rsGroup.location
   resource_group_name = azurerm_resource_group.rsGroup.name

   ip_configuration {
     name                          = "testConfiguration"
     subnet_id                     = azurerm_subnet.oursubnet.id
     private_ip_address_allocation = "Static"
   }
 }