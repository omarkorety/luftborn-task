resource "azurerm_virtual_machine" "OurVM" {
   count                 = 1
   name                  = "myVM"
   location              = aszurerm_resource_group.rsGroup.location
   resource_group_name   = azurerm_resource_group.rsGroup.name
   network_interface_ids = [azurerm_network_interface.NI.id]
    custom_data = base64encode(file("scripts/init.sh"))


   vm_size               = "Standard_DS1_v2"
storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile_linux_config {
    disable_password_authentication = true
  }
  ssh_keys= azurerm_ssh_public_key.pk.id
  tags = {
    environment = "staging"
}