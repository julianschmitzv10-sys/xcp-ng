# XCP-ng Infrastructure

Infrastructure-as-Code repository for provisioning and managing my XCP-ng environment.

## Prerequisites

- An existing XCP-ng host
- A running Xen Orchestra instance, currently hosted in Kubernetes as an interim solution

## Stack

- XCP-ng
- Xen Orchestra
- OpenTofu
- Cloud-Init
- Ansible

## Workflow

1. Bootstrap the infrastructure and base VM template.
2. Provision virtual machines with OpenTofu.
3. Pass the provisioned hosts to Ansible.
4. Configure the operating systems and services with Ansible.

## Repository Structure

- `bootstrap/` – Bootstrap infrastructure and VM templates
- `terraform/` – Infrastructure and VM definitions
- `ansible/` – Host configuration and automation
