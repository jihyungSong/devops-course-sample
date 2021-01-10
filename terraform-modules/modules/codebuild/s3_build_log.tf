resource "aws_s3_bucket" "build_log" {
  bucket = "${var.prefix}-${var.environment}-flask"
  acl    = "private"
}
