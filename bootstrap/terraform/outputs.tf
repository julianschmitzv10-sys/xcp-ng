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

# output "pool" {
#     description = "Bootstraped pool"

#     value = {
#         id = data.xenorchestra_pool.pool.id
#         name = data.xenorchestra_pool.pool.name_label
#     }
# }

output "storage" {
    description = "Bootstraped storgae repository"

    value = {
        id = data.xenorchestra_sr.local_storage.id
        name = data.xenorchestra_sr.local_storage.name_label
    }
}
