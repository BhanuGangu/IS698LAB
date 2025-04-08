output "vpc_id" {
  value = module.networking.vpc_id
}

output "web_server_ip" {
  value = module.compute.instance_public_ip
}

output "s3_bucket_name" {
  value = module.storage.bucket_name
}

output "dynamodb_table" {
  value = module.database.table_name
}
