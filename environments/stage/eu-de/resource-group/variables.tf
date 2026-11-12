variable "ibmcloud_api_key" {
  description = "IBM Cloud API key. Set this as a sensitive variable in the Schematics workspace."
  type        = string
  sensitive   = true
}
