output "resource_group_name" {
  description = "Name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_machine_name" {
  description = "Name of the created Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.main.name
}

output "public_ip_address" {
  description = "Public IP address of the Azure VM."
  value       = azurerm_public_ip.main.ip_address
}

output "web_application_url" {
  description = "URL of the deployed web application."
  value       = "http://${azurerm_public_ip.main.ip_address}"
}