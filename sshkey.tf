resource "azurerm_ssh_public_key" "PK" {
  name                = "myPK"
  resource_group_name = "myPK"
  location            = aszurerm_resource_group.rsGroup.location
  public_key          = file("~/.ssh/id_rsa.pub")
}