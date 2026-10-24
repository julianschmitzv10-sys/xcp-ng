locals {
  ansible_ssh_public_key = trimspace(
    file("${path.module}/../.secrets/.ssh/id_ed25519_xcp-ng-demo.pub")
  )
}