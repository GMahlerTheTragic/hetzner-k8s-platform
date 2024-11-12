output "vpc_id" {
  value = hcloud_network.vpc.id
}

output "subnet_ids" {
  value = [for subnet in hcloud_network_subnet.subnet : subnet.id]
}