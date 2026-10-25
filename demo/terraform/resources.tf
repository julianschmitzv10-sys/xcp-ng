# resources.tf

resource "xenorchestra_vm" "demo-1" {
    resource_set = data.terraform_remote_state.bootstrap.outputs.resource_set.id

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.management.id
        # network_id = data.xenorchestra_network.mgmt.id
    }

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.staging.id
        # network_id = data.xenorchestra_network.staging.id
    }

    cpus = 2
    memory_max = 2147483648
    name_label = "demo-1"
    template = data.xenorchestra_template.template.id

    disk {
        sr_id = data.terraform_remote_state.bootstrap.outputs.storage.id
        name_label = "local"
        size = 32212254720
    }

    tags = ["tf-provisioned"]
}

resource "xenorchestra_vm" "demo-2" {
    resource_set = data.terraform_remote_state.bootstrap.outputs.resource_set.id

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.management.id
        # network_id = data.xenorchestra_network.mgmt.id
    }

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.staging.id
        # network_id = data.xenorchestra_network.staging.id
    }

    cpus = 2
    memory_max = 2147483648
    name_label = "demo-2"
    template = data.xenorchestra_template.template.id

    disk {
        sr_id = data.terraform_remote_state.bootstrap.outputs.storage.id
        name_label = "local"
        size = 32212254720
    }

    tags = ["tf-provisioned"]
}

resource "xenorchestra_vm" "demo-3" {
    resource_set = data.terraform_remote_state.bootstrap.outputs.resource_set.id

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.management.id
        # network_id = data.xenorchestra_network.mgmt.id
    }

    network {
        network_id = data.terraform_remote_state.bootstrap.outputs.networks.staging.id
        # network_id = data.xenorchestra_network.staging.id
    }

    cpus = 2
    memory_max = 2147483648
    name_label = "demo-3"
    template = data.xenorchestra_template.template.id

    disk {
        sr_id = data.terraform_remote_state.bootstrap.outputs.storage.id
        name_label = "local"
        size = 32212254720
    }

    tags = ["tf-provisioned"]
}