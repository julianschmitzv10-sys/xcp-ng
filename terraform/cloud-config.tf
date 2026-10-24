resource "xenorchestra_cloud_config" "demo-config" {
  name = "demo cloud config"
  template = <<EOF
#cloud-config

hostname: {name}{index}

ssh_pwauth: false

users:
  - name: ansible
    gecos: Ansible User
    groups: users,admin,wheel
    sudo: "ALL=(ALL) NOPASSWD:ALL"
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys:
      - "${local.ansible_ssh_public_key}"
EOF
}

resource "xenorchestra_cloud_config" "demo-net-config" {
  name = "demo cloud network config"
  template = <<EOF
network:
 version: 1
 config:
 - type: physical
   name: eth0
   subnets:
     - type: dhcp


EOF
}