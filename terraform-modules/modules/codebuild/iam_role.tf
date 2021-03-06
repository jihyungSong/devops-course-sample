data "template_file" "codebuild_role_policy_template" {
  template            =   file("${path.module}/policy/codebuild_role_policy.json")

  vars                =   {
    region            =   var.region
    account_id        =   var.account_id
    s3_bucket_arn     =   aws_s3_bucket.build_log.arn
    git_repo_name     =   var.code_commit_repo_name
  }
}

resource "aws_iam_role" "codebuild_role" {
  name                =   "${var.prefix}-${var.environment}-CodeBuildRole"
  assume_role_policy  =   file("${path.module}/policy/codebuild_assume_policy.json")

  tags = {
    Managed_by        =   "terraform"
  }
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name                =   "${var.prefix}-${var.environment}-CodeBuildPolicy"
  role                =   aws_iam_role.codebuild_role.name
  policy              =   data.template_file.codebuild_role_policy_template.rendered
}
