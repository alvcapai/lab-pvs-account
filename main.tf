terraform {
  required_version = ">= 1.3.0"

  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.49.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.powervs_zone
}

module "powervs_workspace" {
  source  = "terraform-ibm-modules/powervs-workspace/ibm"
  version = "1.1.1"

  pi_workspace_name      = var.powervs_workspace_name
  pi_resource_group_name = var.powervs_resource_group_name
  pi_zone                = var.powervs_zone

  pi_ssh_public_key = var.powervs_ssh_public_key
  #pi_images = length(keys(var.powervs_images)) > 0 ? var.powervs_images : {}
  pi_image_names = []
}

resource "ibm_is_vpc_routing_table_route" "to_account2_via_firewall" {
  vpc         = data.ibm_is_vpc.account1_vpc.id #ibm_is_vpc.account1_vpc.id
  zone        = var.vpc_zone
  destination = var.account2_cidr
  action      = "deliver"
  next_hop    = var.firewall_ip
}

resource "ibm_is_vpc" "account1_vpc" {
  name = "account1-vpc"
  resource_group = var.powervs_resource_group_id
}
