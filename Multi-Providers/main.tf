resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Main VPC"
  }
}

resource "aws_vpc" "secondary_vpc" {
  cidr_block = "10.0.0.0/16"
  provider = aws.aws-us-east
  tags = {
    "Name" = "Secondary VPC"
  }
}

resource "random_pet" "pet_name" {
  length = 5
  separator = "--"
}


resource "aws_s3_bucket" "pet_bucket" {
  bucket = random_pet.pet_name.id
  acl = "public-read"
  force_destroy = true
  tags = {
    Name = "Pet Bucket"
    Environment = "Dev"
  }
}