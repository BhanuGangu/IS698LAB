terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "networking" {
  source          = "./modules/networking"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  env            = var.env
}

module "compute" {
  source          = "./modules/compute"
  vpc_id          = module.networking.vpc_id
  subnet_id       = module.networking.private_subnet_ids[0]
  security_groups = [module.networking.web_sg_id]
  key_name        = var.key_name
  env            = var.env
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = "${var.env}-${var.bucket_name}"
  env        = var.env
}

module "database" {
  source     = "./modules/database"
  table_name = "${var.env}-${var.table_name}"
  hash_key   = "UserID"
  env       = var.env
}
