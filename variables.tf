variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  description = "Key Pair"
  default     =  "KP-win2022-Jenkins-MASTER-us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     =  "t3.small"
}

variable "security_group" {
  description = "Security Group"
  default     = "SG"
}

variable "tag_name" {
  description = "EC2 Tag for Name"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI"
  default     = "ami-0b9064170e32bde34"
}
