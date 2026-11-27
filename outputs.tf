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
