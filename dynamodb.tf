resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = merge(
            var.tags,
            {
            "Name" = "DynamoDB Terraform State Lock Table"
        },
    )
}