# locals.tf

locals {
    vm_count = 3


    vms = {
        for i in range(local.vm_count) :
            "vm${i+1}" => {
                name = "demo-${i+1}"
                # cloud_config = xenorchestra_cloud_config.demo-config-1.template
                config_name = "demo cloud config ${i+1}"
            }
    }

    ansible_hosts = {
        for key, vm in xenorchestra_vm.vms :
        vm.name_label => {
            ansible_host = one(vm.network[0].ipv4_addresses)
        }
    }
}
