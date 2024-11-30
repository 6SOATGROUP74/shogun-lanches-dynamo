# Provedor da AWS
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

resource "aws_dynamodb_table" "tbcliente" {
  name           = "tb_cliente"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "id_cliente"            

  attribute {
    name = "id_cliente"
    type = "S" 
  }

  attribute {
    name = "cpf"
    type = "S" 
  }

  global_secondary_index {
    name            = "cpf-index"
    hash_key        = "cpf"       
    projection_type = "ALL"        
  }

  tags = {
    Environment = "dev"
    Team        = "backend"
  }
}