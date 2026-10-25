# cloud-config.tf

resource "xenorchestra_cloud_config" "demo-configs" {
  for_each = local.vms

  name = each.value.config_name
  template = templatefile("cloud_config.tftpl", {
    hostname = each.value.name
  })
}  

# resource "xenorchestra_cloud_config" "demo-config-1" {
#   name = "demo cloud config"
#   template = templatefile("cloud_config.tftpl", {
#     hostname = "demo"
#     index = "1"
#   })
# }  

# resource "xenorchestra_cloud_config" "demo-config-2" {
#   name = "demo cloud config"
#   template = templatefile("cloud_config.tftpl", {
#     hostname = "demo"
#     index = "2"
#   })
# }

# resource "xenorchestra_cloud_config" "demo-config-3" {
#   name = "demo cloud config"
#   template = templatefile("cloud_config.tftpl", {
#     hostname = "demo"
#     index = "3"
#   })
#   template = <<EOF
# #cloud-config
# autoinstall:
#   version: 1

#   user-data:

#     hostname: {name}{index}
    
#     late-commands:
#       - curtin in-target -- cloud-init clean --seed
# runcmd:
#   - [mkdir, -p, /mnt/guest-tools]
#   - [mount, /dev/cdrom, /mnt/guest-tools]
#   - [bash, /mnt/guest-tools/Linux/install.sh]
#   - [umount, /dev/cdrom]
#   - [rm, -rf, /mnt/guest-tools]
# EOF
# }

# resource "xenorchestra_cloud_config" "demo-net-config" {
#   name = "demo cloud network config"
#   template = <<EOF
# network:
#  version: 1
#  config:
#  - type: physical
#    name: eth0
#    subnets:
#      - type: dhcp


# EOF
# }