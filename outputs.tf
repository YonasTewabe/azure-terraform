output "resource_group_name" {
  description = "Name of the created Azure Resource Group."
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "ID of the created Azure Resource Group."
  value       = azurerm_resource_group.this.id
}

output "storage_account_name" {
  description = "Name of the created Azure Storage Account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "ID of the created Azure Storage Account."
  value       = azurerm_storage_account.this.id
}

output "vnet_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.this.name
}

output "vm_name" {
  description = "Name of the created Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.this.name
}

output "vm_public_ip" {
  description = "Public IP address of the Linux Virtual Machine."
  value       = azurerm_public_ip.vm.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the Linux Virtual Machine."
  value       = azurerm_network_interface.vm.private_ip_address
}

output "ssh_command" {
  description = "SSH command to connect to the VM."
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.vm.ip_address}"
}

output "generated_ssh_private_key" {
  description = "Auto-generated SSH private key (empty if ssh_public_key variable was provided)."
  value       = var.ssh_public_key == null ? tls_private_key.ssh[0].private_key_openssh : null
  sensitive   = true
}
