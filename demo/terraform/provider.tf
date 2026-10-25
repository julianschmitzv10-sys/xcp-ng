# provider.tf

terraform {
  required_providers {
    xenorchestra = {
        source = "vatesfr/xenorchestra"
        version = "0.41.2"
    }
    # local = {
    #     source = "hashicorp/local"
    #     version = "~> 2.0"
    # }
  }
}

provider "xenorchestra" {
  url = var.xo_url
  token = var.xo_token
  insecure = var.xo_insecure
}