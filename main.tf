resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = "my-vmss"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West US"
  sku                 = "Standard_DS1_v2"
  instances           = 3
  admin_username      = "adminuser"
  admin_password      = "adminpassword"
  upgrade_mode        = "Automatic"
  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  # Additional configuration for scaling, load balancing, etc.
}
