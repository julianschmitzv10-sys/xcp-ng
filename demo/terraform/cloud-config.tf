# cloud-config.tf

# resource "xenorchestra_cloud_config" "demo-configs" {
#   for_each = local.vms

#   name = each.value.config_name
#   template = templatefile("cloud_config.tftpl", {
#     hostname = each.value.name
#   })
# }  
