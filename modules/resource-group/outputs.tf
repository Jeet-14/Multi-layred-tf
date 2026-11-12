output "id" {
  description = "ID of the created resource group."
  value       = ibm_resource_group.this.id
}

output "name" {
  description = "Name of the created resource group."
  value       = ibm_resource_group.this.name
}
