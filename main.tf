resource "hcloud_ssh_key" "my_ssh_key" {
  name       = "my-ssh-key"
  public_key = file(var.public_key_path)
}

module "vpc" {
  source = "./modules/vpc"
  base_cidr_range = "10.0.0.0/8"
  cidr_ranges = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

module "k8s_nodes" {
  source = "./modules/private-server-group"
  image = "ubuntu-20.04"
  ips = ["10.0.1.5", "10.0.2.5", "10.0.3.5"]
  names = ["k8s-control-plane", "k8s-worker-node-a", "k8s-worker-node-b"]
  network_id = module.vpc.vpc_id
  ssh_key_path = var.public_key_path_ansible
  hetzner_ssh_key_id = hcloud_ssh_key.my_ssh_key.id
  depends_on = [module.vpc]
}

module "bastion_host" {
  source = "./modules/bastion-host"
  image = "ubuntu-20.04"
  ip = "10.0.4.5"
  name = "bastion-host"
  network_id = module.vpc.vpc_id
  ssh_key_path = var.public_key_path
  wireguard_client_public_key = var.wireguard_client_public_key
  hetzner_ssh_key_id = hcloud_ssh_key.my_ssh_key.id

  depends_on = [module.vpc]
}