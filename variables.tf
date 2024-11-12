variable "public_key_path" {
  description = "Path to the SSH public key for the bastion host."
  type        = string
}

variable "public_key_path_ansible" {
  description = "Path to the SSH public key for the worker nodes."
  type        = string
}

variable "wireguard_client_public_key" {
  description = "WireGuard public key for the bastion host."
  type        = string
  sensitive   = true
}

variable "hcloud_token" {
  sensitive = true
}
