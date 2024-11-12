Ansible Playbook for Kubernetes Cluster Setup

This Ansible playbook installs and configures a Kubernetes cluster on a set of private nodes. It assumes that the private nodes are already provisioned and accessible via SSH.

Project Overview

The Ansible playbook is designed to:

Set up the Kubernetes cluster on the private nodes.
Install necessary dependencies like Docker and kubeadm.
Configure the Kubernetes master and worker nodes.
Set up kubeconfig for the local environment to interact with the Kubernetes cluster.
Requirements

Ansible (v2.10 or later)
SSH access to the private nodes
Kubernetes-related software dependencies (handled by the playbook)
Prerequisites

Before running the playbook, ensure the following:

The private nodes have been provisioned (via Terraform).
You can SSH into the private nodes.
The WireGuard VPN is configured and connected (if accessing private nodes via VPN).