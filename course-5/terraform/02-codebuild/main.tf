terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region              =   var.region
}

module "codebuild" {
  source                =   "../../../terraform-modules/modules/codebuild"

  environment           =   var.environment
  prefix                =   var.prefix
  account_id            =   var.account_id
  region                =   var.region
  code_commit_git_url   =   var.code_commit_git_url
  image_tag             =   var.image_tag
}
