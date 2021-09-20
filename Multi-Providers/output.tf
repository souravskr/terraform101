output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "secondary_vpc_id" {
  value = aws_vpc.secondary_vpc.id
}

output "bucket_id" {
  value = aws_s3_bucket.pet_bucket.id
}

output "random_id" {
  value = random_pet.pet_name.id
}


