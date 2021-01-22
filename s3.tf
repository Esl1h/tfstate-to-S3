resource "aws_s3_bucket" "iaac" {
    bucket="${var.bucket_name}-${var.env}"
    acl = "private"
    tags = var.tags

    versioning {
        enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    object_lock_configuration {
        object_lock_enabled = "Enabled"
    }
 
#     policy = <<POLICY
# {
#   "Id": "Policy1600979153189",
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "Stmt1600979084653",
#       "Action": [
#         "s3:ListBucket"
#       ],
#       "Effect": "Deny",
#       "Resource": "arn:aws:s3:::${var.bucket_name}-${var.env}/*",
#       "Principal": "*"
#     },
#     {
#       "Sid": "Stmt1600979150930",
#       "Action": [
#         "s3:DeleteObject",
#         "s3:GetObject",
#         "s3:PutObject"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::${var.bucket_name}-${var.env}/*",
#       "Principal": "*"
#     }
#   ]
# }
# POLICY

}