provider "aws" {
    region = "ap-northeast-1"
}

terraform {
    backend "s3" {
        bucket = "miyamoto-ryohei-terraform-state"
        key = "stage/data-store/mysql/terraform.tfstate"
        region = "ap-northeast-1"
        dynamodb_table = "miyamoto-ryohei-terraform-state-locks"
        encrypt = true
    }
}

resource "aws_db_instance" "example" {
    identifier_prefix = "miyanmoto-ryohei-mysql"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    skip_final_snapshot = true
    db_name = "example_database"

    username = var.db_username
    password = var.db_password
}