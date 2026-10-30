# xcp-ng_vm-cluster/main.tf

terraform {
  required_version = "1.13.2"
  required_providers {
    xenorchestra = {
      source  = "vatesfr/xenorchestra"
      version = "0.41.2"
    }
  }
}

resource "xenorchestra_vm" "node" {
  count = var.node_count

  resource_set = var.resource_set_id

  dynamic "network" {
    for_each = var.networks

    content {
      network_id       = network.value.network_id
      expected_ip_cidr = network.value.expected_ip_cidr
    }
  }

  cpus       = var.cores
  memory_max = var.RAM_Gb * local.fak_1GB
  name_label = "${var.node_name}-${count.index + 1}"
  template   = var.template_id
  cloud_config = templatefile("cloud_config.tftpl", {
    hostname               = "${var.node_name}-${count.index + 1}"
    cloud_config_extension = var.cloud_config_extension
  })

  cdrom {
    id = var.guest-tools-iso
  }

  dynamic "disk" {
    for_each = var.storage_repositories

    content {
      sr_id      = disk.value.sr_id
      name_label = disk.value.name_label
      size       = disk.value.size_in_Gb * local.fak_1GB
    }
  }

  tags = concat(
    ["tf-provisioned", "${var.cluster_name}"],
    var.tags
  )
}
