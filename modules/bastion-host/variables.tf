variable "ip" {
  description = "The private IP address for the bastion host."
  type        = string
}

variable "image" {
  description = "The image for the bastion host."
  type        = string
}

variable "name" {
  description = "The name of the bastion host."
  type        = string
}

variable "network_id" {
  description = "Id associated with the network of the host"
  type        = string
}

variable "hetzner_ssh_key_id" {
  description = "Id of hetzner ssh key"
  type = string
}

variable "ssh_key_path" {
  description = "Path to the file with the ssh key to be uploaded to the server"
  type = string
  sensitive = true
}

variable "wireguard_client_public_key" {
  sensitive = true
}
