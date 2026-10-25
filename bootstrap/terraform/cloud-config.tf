# cloud-config.tf

resource "xenorchestra_cloud_config" "template-config" {
  name = "demo cloud config"
  template = <<EOF
#cloud-config
autoinstall:
  version: 1

  # packages:
  #   - xe-guest-utilities

  ssh:
    allow-pw: false
    install-server: true

  user-data:

    hostname: ubuntu
    # ssh_pwauth: false

    users:
      - name: ansible
        gecos: Ansible User
        groups: users,admin,wheel
        sudo: "ALL=(ALL) NOPASSWD:ALL"
        shell: /bin/bash
        lock_passwd: true
        ssh_authorized_keys:
          - "${local.ansible_ssh_public_key}"

  # late-commands:
  #   - curtin in-target -- cloud-init clean --seed --machine-id

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