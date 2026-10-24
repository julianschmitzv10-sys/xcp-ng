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
    id = "a8da01c3-0755-406f-8456-26e7589703a8"
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
  name_label = "Ubuntu26-testing-1"
  template = data.xenorchestra_template.template.id
  cdrom {
    id = data.xenorchestra_vdi.ubuntu-iso.id
  }
  disk {
      sr_id = data.xenorchestra_sr.local_storage.id
      name_label = "Demo-VM"
      size = 32212254720
  }
}
