#outputs.tf

output "networks" {
    description = "Bootstraped network infra"

    value = {
        management = {
            id = resource.xenorchestra_network.mgmt.id
            name = resource.xenorchestra_network.mgmt.name_label
        }

        staging = {
            id = resource.xenorchestra_network.staging.id
            name = resource.xenorchestra_network.staging.name_label
        }
    }
}

output "resource_set" {
    description = "Bootstraped resource set"

    value = {
        id = resource.xenorchestra_resource_set.tier1.id
        name = resource.xenorchestra_resource_set.tier1.name
    }
}

output "storage" {
    description = "Bootstraped storgae repository"

    value = {
        id = data.xenorchestra_sr.local_storage.id
        name = data.xenorchestra_sr.local_storage.name_label
    }
}
