# resources.tf

moved {
  from = xenorchestra_vm.vms["vm1"]
  to   = module.XO_vm-cluster.xenorchestra_vm.node[0]
}
moved {
  from = xenorchestra_vm.vms["vm2"]
  to   = module.XO_vm-cluster.xenorchestra_vm.node[1]
}
moved {
  from = xenorchestra_vm.vms["vm3"]
  to   = module.XO_vm-cluster.xenorchestra_vm.node[2]
}

module "XO_vm-cluster" {
  source          = "../../modules/XO_vm-cluster"
  node_count      = 3
  resource_set_id = data.terraform_remote_state.bootstrap.outputs.resource_set.id
  networks        = local.networks
  cores           = 2
  RAM_Gb          = 2
  node_name       = "demo"
  template_id     = data.xenorchestra_template.template.id
  # cloud_config_extension = 
  guest-tools-iso      = data.xenorchestra_vdi.guest-tools-iso.id
  storage_repositories = local.storage_repositories
  cluster_name         = "demo"
  tags                 = ["testing"]
}