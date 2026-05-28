provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket       = "demo-app-deploy-335-vishnu-2026"   # must exist before init
    key          = "prod/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true                                # avoids DynamoDB warning
  }
}

module "network" {
  source      = "./modules/network"
  azs         = var.azs
  common_tags = var.common_tags
}

module "compute" {
  source        = "./modules/compute"
  vpc_id        = module.network.vpc_id
  subnet_ids    = module.network.public_subnets
  ami_id        = var.ami_id
  key_name      = var.key_name
  instance_type = var.instance_type
  common_tags   = var.common_tags
}

module "database" {
  source     = "./modules/database"
  table_name = var.db_table_name
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.s3_bucket_name
}
