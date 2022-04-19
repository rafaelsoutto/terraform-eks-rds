resource "aws_s3_bucket" "backup_bucket" {
  bucket = "backup-restore-infra-cit-poc"

  tags = {
    rds = "True"
    Environment = var.environment
  }
}
