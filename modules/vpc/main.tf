terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

resource "hcloud_network" "vpc" {
  name     = "base-vpc"
  ip_range = var.base_cidr_range
}

resource "hcloud_network_subnet" "subnet" {
  count        = length(var.cidr_ranges)
  network_id   = hcloud_network.vpc.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = var.cidr_ranges[count.index]
}
