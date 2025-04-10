variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
}

variable "powervs_workspace_name" {
  description = "PowerVS workspace name"
  type        = string
}

variable "powervs_resource_group_name" {
  description = "IBM Cloud Resource Group name"
  type        = string
}

variable "powervs_zone" {
  description = "PowerVS zone (e.g. sao01)"
  type        = string
}

variable "powervs_ssh_public_key" {
  description = "SSH public key object for PowerVS"
  type = object({
    key_name   = string
    public_key = string
  })
}

variable "firewall_ip" {
  description = "Firewall IP address for routing"
  type        = string
}

variable "vpc_zone" {
  description = "Zone for the VPC route"
  type        = string
}

variable "account2_cidr" {
  description = "CIDR block of account 2 VPC"
  type        = string
}

variable "powervs_cloud_instance_id" {
  description = "ID da Cloud Instance do PowerVS"
  type        = string
}

variable "powervs_region" {
  description = "Região do PowerVS"
  type        = string
}

variable "powervs_images" {
  description = "Lista de imagens a serem importadas para PowerVS"
  type        = map(object({
    pi_image_bucket_name = string
    pi_image_name        = string
  }))
  default     = {}
}

variable "powervs_resource_group_id" {
  description = "ID do resource group do PowerVS"
  type        = string
}
