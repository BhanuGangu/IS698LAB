output "bucket_name" {
  value = aws_s3_bucket.web_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.web_bucket.arn
}

output "bucket_url" {
  value = "https://${aws_s3_bucket.web_bucket.bucket}.s3.${aws_s3_bucket.web_bucket.region}.amazonaws.com"
}
