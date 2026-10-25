# ansible.tf

resource "local_file" "ansible_inventory" {
    filename = "${path.module}/../ansible/inventory/hosts.yaml"
    file_permission = "0644"

    content = yamlencode({
        all = {
            children = {
                demo = {
                    vars = {
                        ansible_user = "ansible"
                    }
                    hosts = local.ansible_hosts
                }
            }
        }
    })

    lifecycle {
      precondition {
        condition = alltrue([
            for key, vm in xenorchestra_vm.vms :
            length(vm.network[0].ipv4_addresses) == 1
        ])

        error_message = "Every VM must report exactly one IPv4 address on the first network interface."
      }
    }
}