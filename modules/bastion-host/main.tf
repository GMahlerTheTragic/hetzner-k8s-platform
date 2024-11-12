terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

resource "hcloud_firewall" "bastionHost" {
  name = "firewall-bastion-host"
  rule {
    direction = "in"
    protocol  = "udp"
    port = "51820"
    source_ips = [
      "0.0.0.0/0",
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port = "22"
    source_ips = [
      "10.0.0.0/8",
    ]
  }

}

resource "hcloud_server" "bastion_host" {
  name        = var.name
  server_type = "cx22"
  image       = var.image
  location    = "nbg1"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  ssh_keys = [var.hetzner_ssh_key_id]

  network {
    network_id = var.network_id
    ip         = var.ip
  }

  firewall_ids = [hcloud_firewall.bastionHost.id]

  user_data = templatefile("cloud-init-bastion.yaml", {
    ssh_public_key           = file(var.ssh_key_path),
    wireguard_client_public_key = var.wireguard_client_public_key,
  })
}

resource "hcloud_network_route" "route_to_inet" {
  network_id  = var.network_id
  destination = "0.0.0.0/0"
  gateway     = var.ip
}

output "bastion_id" {
  value = hcloud_server.bastion_host.id
}
