# locals.tf

locals {
#   vm_count = 3


#   vms = {
#     for i in range(local.vm_count) :
#     "vm${i + 1}" => {
#       name        = "demo-${i + 1}"
#       config_name = "demo cloud config ${i + 1}"
#     }
#   }

#   ansible_hosts = {
#     for key, vm in xenorchestra_vm.vms :
#     vm.name_label => {
#       ansible_host = one(vm.network[0].ipv4_addresses)
#     }
#   }

  networks = {
    mgmt = {
      network_id       = data.terraform_remote_state.bootstrap.outputs.networks.management.id
      expected_ip_cidr = "10.0.4.0/24"
    }
    stage = {
      network_id       = data.terraform_remote_state.bootstrap.outputs.networks.staging.id
      expected_ip_cidr = "10.0.5.0/24"
    }
  }

  storage_repositories = {
    local = {
        sr_id = data.terraform_remote_state.bootstrap.outputs.storage.id
        name_label = "local"
        size_in_Gb = 30
    }
  }
}
