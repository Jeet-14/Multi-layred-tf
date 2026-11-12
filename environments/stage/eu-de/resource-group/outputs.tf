output "resource_group_id" {
  description = "ID of the resource group created in this workspace."
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the resource group created in this workspace."
  value       = module.resource_group.name
}
