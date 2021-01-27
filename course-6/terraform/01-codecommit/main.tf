terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region              = var.region
}

module "codecommit" {
  source            = "../../../terraform-modules/modules/codecommit"

  environment       = var.environment
  prefix            = var.prefix
}
