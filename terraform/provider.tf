terraform {
  required_providers {
    xenorchestra = {
        source = "vatesfr/xenorchestra"
        version = "0.41.2"
    }
  }
}

provider "xenorchestra" {
  url = var.xo_url
  token = var.xo_token
  insecure = var.xo_insecure
}