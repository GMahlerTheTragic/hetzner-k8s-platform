# Terraform Project for Bastion Host and Kubernetes Cluster Setup

This repository contains a Terraform project that provisions a bastion host with WireGuard VPN, along with three private nodes. These nodes can then be configured to install a Kubernetes cluster using the Ansible playbook provided in the subfolder.

## Project Overview

- **Bastion Host**: A secure bastion host is provisioned to allow remote access to the private nodes via a WireGuard VPN connection.
- **Private Nodes**: Three private nodes that can be used for setting up a Kubernetes cluster.
- **WireGuard VPN**: The bastion host is configured with WireGuard VPN for secure communication with the private nodes.
- **Kubernetes Cluster**: The private nodes are intended to be used for setting up a Kubernetes cluster, which is handled by an Ansible playbook (located in the `ansible` subfolder).

## Requirements

- Terraform (v1.0 or later)
- Hetner Cloud Account
- WireGuard VPN client (for connecting to the bastion host).
- Ansible (for setting up the Kubernetes cluster).

## Project Structure

## Get started

### Step 1: Set Up Your Cloud Provider Account and API Key
1. Create an Account: Sign up or log in to your cloud provider account.
2. Generate an API Key:
	* Navigate to the API key management section of your cloud provider dashboard.
	* Generate an API key with READ and WRITE access permissions.
3. Export the API Key: Save the key in an environment variable by running the following command in your terminal:
	
	```
	export TF_VAR_hcloud_token=<your_token>
	```

	Replace <your_token> with the API key you generated.

### Step 2: Generate SSH Keys

You will need to create two separate RSA SSH keys: one for the bastion host and another for Ansible.

#### Generate SSH Key for the Bastion Host
1. Run the following command to generate a new RSA key:
	`ssh-keygen -t rsa -b 4096 -C "Your email"`
2. Name the Key: Ensure the key is saved as `~/.ssh/id_rsa_bastion` when prompted for the file name. If the file already exists, overwrite it if appropriate.

#### Generate SSH Key for Ansible
1. Run the following command to generate a second RSA key:
`ssh-keygen -t rsa -b 4096 -C "Your email"`
2. Name the Key: Save this key as `~/.ssh/id_rsa_ansible`. Again, ensure the name is accurate to avoid confusion.

### Step 3: Setup WireGuard VPN

TBD

### Step 4: Export Environment Variables for Keys
Set the environment variables required for Terraform by running the following commands:
1. Export API Token:

	```
	export TF_VAR_hcloud_token=<your_token>
	```

	Replace <your_token> with your cloud provider's API token.

2. Export SSH Key Paths:

	```
	export TF_VAR_public_key_path_ansible=~/.ssh/id_rsa_ansible.pub
	export TF_VAR_public_key_path=~/.ssh/id_rsa_bastion.pub
	```


3. Export WireGuard Client Public Key:
	```
	export TF_VAR_wireguard_client_public_key=<your_wireguard_key>
	```
	Replace <your_wireguard_key> with the WireGuard client public key.