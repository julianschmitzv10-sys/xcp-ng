# resources.tf

resource "xenorchestra_network" "mgmt" {
  name_label = "vMGMT"
  name_description = "Management Network"
  pool_id = data.xenorchestra_pool.pool.id
  source_pif_device = "eth0"
  vlan = 4
}

resource "xenorchestra_network" "staging" {
  name_label = "vSTAGE"
  name_description = "Staging Network"
  pool_id = data.xenorchestra_pool.pool.id
  source_pif_device = "eth0"
  vlan = 5
}



resource "xenorchestra_vm" "template-target_Ubuntu-26-04-1" {
  network {
    network_id = resource.xenorchestra_network.mgmt.id
  }
  network {
    network_id = resource.xenorchestra_network.staging.id
  }
  cpus = 2
  memory_max = 2147483648
  name_label = "Ubuntu-26.04.1"
  template = data.xenorchestra_template.template.id
  cloud_config = xenorchestra_cloud_config.demo-config.template
#   cloud_network_config = xenorchestra_cloud_config.demo-net-config.template
  cdrom {
    id = data.xenorchestra_vdi.ubuntu-iso.id
  }
  disk {
      sr_id = data.xenorchestra_sr.local_storage.id
      name_label = "local"
      size = 32212254720
  }
}
