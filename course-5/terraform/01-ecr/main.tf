terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region              = var.region
}

module "ecr" {
  source            = "../../../terraform-modules/modules/ecr"

  environment       = var.environment
  prefix            = var.prefix
}
