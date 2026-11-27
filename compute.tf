resource "tls_private_key" "ssh" {
  count     = var.ssh_public_key == null ? 1 : 0
  algorithm = "ED25519"
}

locals {
  vm_ssh_public_key = var.ssh_public_key != null ? var.ssh_public_key : tls_private_key.ssh[0].public_key_openssh
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = "vm-${local.name_prefix}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  size                = var.vm_size
  admin_username      = var.admin_username
  tags                = local.common_tags

  network_interface_ids = [
    azurerm_network_interface.vm.id,
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = local.vm_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}
