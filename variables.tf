variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "firewall_ip" {
  description = "Firewall IP in network account"
  type        = string
}

variable "powervs_cloud_instance_id" {
  description = "PowerVS Cloud Instance ID"
  type        = string
}

variable "powervs_region" {
  description = "PowerVS region"
  type        = string
}

variable "powervs_name" {
  description = "Name of the PowerVS Cloud Instance"
  type        = string
}

variable "powervs_resource_group_id" {
  description = "Resource group ID for PowerVS"
  type        = string
}

variable "powervs_datacenter" {
  description = "PowerVS datacenter, e.g., sao01, dal10"
  type        = string
}
