resource "ibm_is_vpc" "account1_vpc" {
  name = "account1-vpc"
}

resource "ibm_is_subnet" "account1_subnet" {
  name            = "account1-subnet"
  vpc             = ibm_is_vpc.account1_vpc.id
  zone            = "br-sao-1"
  ipv4_cidr_block = "172.16.0.0/24"
}

resource "ibm_is_vpc_routing_table" "account1_route_table" {
  vpc  = ibm_is_vpc.account1_vpc.id
  name = "account1-custom-route"
}

resource "ibm_is_vpc_routing_table_route" "to_account2_via_firewall" {
  routing_table = ibm_is_vpc_routing_table.account1_route_table.id
  destination   = "172.20.1.0/24"
  next_hop      = var.firewall_ip
}

# PowerVS Workspace na Account 1
resource "ibm_pi_workspace" "account1_powervs" {
  pi_cloud_instance_id = var.powervs_cloud_instance_id
  pi_workspace_name    = "account1-powervs-ws"
  region               = var.powervs_region
}

module "powervs_workspace" {
  source  = "terraform-ibm-modules/powervs-workspace/ibm"
  version = "1.1.1" # ou latest estável

  pi_name               = var.powervs_name
  pi_resource_group_id  = var.powervs_resource_group_id
  pi_datacenter         = var.powervs_datacenter

  # Opcional: redes e VLAN
  pi_networks = [
    {
      name       = "powervs-network"
      type       = "vlan"
      cidr_block = "192.168.100.0/24"
    }
  ]
}
