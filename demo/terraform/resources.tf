# resources.tf

resource "xenorchestra_vm" "vms" {
    for_each = local.vms
    resource_set = data.terraform_remote_state.bootstrap.outputs.resource_set.id

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.management.id
        expected_ip_cidr = "10.0.4.0/24"
    }

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.staging.id
        expected_ip_cidr = "10.0.5.0/24"
    }

    cpus = 2
    memory_max = 2147483648
    name_label = each.value.name
    template = data.xenorchestra_template.template.id
    cloud_config = xenorchestra_cloud_config.demo-configs[each.key].template
    
    cdrom {
    id = data.xenorchestra_vdi.guest-tools-iso.id
  }

    disk {
        sr_id = data.terraform_remote_state.bootstrap.outputs.storage.id
        name_label = "local"
        size = 32212254720
    }

    tags = ["tf-provisioned"]
}
