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