variable "ips" {
  description = "List of private IP addresses for the private nodes."
  type        = list(string)
}

variable "image" {
  description = "The image for the private nodes."
  type        = string
}

variable "names" {
  description = "List of names for the private nodes."
  type        = list(string)
}

variable "ssh_key_path" {
  description = "Path to the file with the ssh key to be uploaded to the server"
  type = string
  sensitive = true
}

variable "network_id" {
  description = "Id associated with the network of the host"
  type        = string
}

variable "hetzner_ssh_key_id" {
  description = "Id of hetzner ssh key"
  type = string
}