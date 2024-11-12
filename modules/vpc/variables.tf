variable "base_cidr_range" {
  description = "Base CIDR range for the VPC"
  type        = string
}

variable "cidr_ranges" {
  description = "List of CIDR ranges for subnets within the VPC"
  type        = list(string)
}
