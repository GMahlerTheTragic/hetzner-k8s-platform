terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

resource "hcloud_firewall" "private_server_fw" {
  name = "firewall-privates-server"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "10.0.0.0/16",
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "1-65535"
    source_ips = [
      "10.0.0.0/16",
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "1-65535"
    source_ips = [
      "10.0.0.0/16",
    ]
  }

}

resource "hcloud_server" "private_nodes" {
  count       = length(var.ips)  # Creates a server for each IP provided
  name        = var.names[count.index]
  server_type = "cx22"
  image       = var.image
  location    = "nbg1"

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  ssh_keys = [var.hetzner_ssh_key_id]

  network {
    network_id = var.network_id
    ip         = var.ips[count.index]
  }

  firewall_ids = [hcloud_firewall.private_server_fw.id]

  user_data = templatefile("cloud-init-k8s-nodes.yaml", {
    ssh_public_key = file(var.ssh_key_path),
  })
}

output "private_node_ids" {
  value = [for node in hcloud_server.private_nodes : node.id]
}
