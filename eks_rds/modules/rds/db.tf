resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  identifier             = var.server_name
  engine                 = var.sqlserver_engine
  engine_version         = var.sqlserver_engineversion
  instance_class         = var.instance_class
  username               = var.rds_username
  port                   = var.db_port
  password               = var.password
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = var.security_group_id
  db_subnet_group_name   = aws_db_subnet_group.default.name
  option_group_name      = aws_db_option_group.bkp_restore_option_group.name

  depends_on = [
      aws_db_option_group.bkp_restore_option_group,
      aws_db_subnet_group.default
      ]
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.server_name}-subnet-group"
  subnet_ids = var.subnets
}

resource "aws_db_option_group" "bkp_restore_option_group" {
  name                     = "bkp-restore-mssql-web"
  option_group_description = "option group permit to use S3 bucket to backup and restore"
  engine_name              = var.sqlserver_engine
  major_engine_version     = "14.00"

  option {
    option_name = "SQLSERVER_BACKUP_RESTORE"

    option_settings {
      name  = "IAM_ROLE_ARN"
      value = aws_iam_role.backup_restore_role.arn
    }
  }

  depends_on = [aws_iam_role.backup_restore_role]
}

data "aws_iam_policy_document" "option_group_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "rds.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "backup_restore_role" {
  name               = "${var.server_name}-s3-bkp-restore-OG"
  assume_role_policy = data.aws_iam_policy_document.option_group_role.json
}

data "aws_iam_policy_document" "backup_restore_option_group" {
  statement {
    actions = [
        "s3:ListBucket",
        "s3:GetBucketLocation"
    ]
    resources = ["${var.buckup_bucket_arn}"]
  }
  statement {
    actions   = [
            "s3:GetObjectMetaData",
            "s3:GetObject",
            "s3:PutObject",
            "s3:ListMultipartUploadParts",
            "s3:AbortMultipartUpload"
                ]
    resources = ["${var.buckup_bucket_arn}/*"]
  }
}


resource "aws_iam_policy" "backup_restore_policy" {
  name   = "${var.server_name}-s3-bkp-restore-policy"
  policy = data.aws_iam_policy_document.backup_restore_option_group.json
}


resource "aws_iam_policy_attachment" "backup_restore_policy_attachment" {
  name       = "bkp-restore-policy-attach"
  roles      = [aws_iam_role.backup_restore_role.name]
  policy_arn = aws_iam_policy.backup_restore_policy.arn
}
