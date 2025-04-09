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

variable "powervs_workspace_name" {
  description = "Name of the PowerVS workspace"
  type        = string
}

variable "powervs_resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "powervs_zone" {
  description = "Zone for PowerVS workspace (e.g., sao01)"
  type        = string
}

variable "powervs_ssh_public_key" {
  description = "SSH public key for PowerVS access"
  type        = string
}
