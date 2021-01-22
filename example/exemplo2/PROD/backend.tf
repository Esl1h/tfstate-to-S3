terraform {
    backend "s3" {
        bucket = "iaac-terraform-prod"
        key = "tfstates/NOMEDOPROJETO/terraform.tfstate"
        region = "sa-east-1"
        profile = "default"
        dynamodb_table = "terraform_state"
        encrypt = "true"
    }
}