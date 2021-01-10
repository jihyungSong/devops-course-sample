resource "aws_codebuild_project" "codebuild_project" {
  name                =   "${var.prefix}-${var.environment}-FlaskBuild"
  description         =   "Build Flask Application Container Image"
  build_timeout       =   "10"
  service_role        =   aws_iam_role.codebuild_role.arn

  source {
    type              =   "CODECOMMIT"
    location          =   var.code_commit_git_url
    git_clone_depth   =   1
  }

  environment {
    compute_type                =   "BUILD_GENERAL1_SMALL"
    image                       =   "aws/codebuild/standard:5.0"
    type                        =   "LINUX_CONTAINER"
    image_pull_credentials_type =   "CODEBUILD"
    privileged_mode             =   true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.account_id
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = var.image_tag
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${var.prefix}-${var.environment}-flask"
    }
  }

  artifacts {
    type      =   "NO_ARTIFACTS"
  }

  logs_config {
    cloudwatch_logs {
      group_name  =   "log-group"
      stream_name =   "log-stream"
    }

    s3_logs {
      status      =   "ENABLED"
      location    =   "${aws_s3_bucket.build_log.id}/build-log"
    }
  }

  tags = {
    Environment   =   "Test"
    Managed_by    =   "terraform"
  }

  depends_on      = [aws_iam_role_policy.codebuild_policy, aws_s3_bucket.build_log]
}
