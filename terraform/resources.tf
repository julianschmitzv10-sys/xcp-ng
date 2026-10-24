data "xenorchestra_sr" "local_storage" {
  name_label = "vm-pool-sr-1"
}

data "xenorchestra_sr" "iso_storage" {
  name_label = "iso-pool"
}

data "xenorchestra_pool" "pool" {
  name_label = "xcpng-host-testing-1"
}

data "xenorchestra_template" "template" {
  name_label = "Ubuntu Noble Numbat 24.04"
}

data "xenorchestra_vdi" "ubuntu-iso" {
    id = "0ab9f7ac-4cc3-430f-978b-e493016814f0"
}

data "xenorchestra_network" "net" {
  name_label = "Pool-wide network 1"
}

resource "xenorchestra_vm" "demo-vm" {
  network {
    network_id = data.xenorchestra_network.net.id
  }
  cpus = 2
  memory_max = 2147483648
  name_label = "Ubuntu24-testing-1"
  template = data.xenorchestra_template.template.id
#   cloud_config = xenorchestra_cloud_config.demo-config.template
#   cloud_network_config = xenorchestra_cloud_config.demo-net-config.template
  cdrom {
    id = data.xenorchestra_vdi.ubuntu-iso.id
  }
  disk {
      sr_id = data.xenorchestra_sr.local_storage.id
      name_label = "Demo-VM"
      size = 32212254720
  }
}
