variable instance_type {
   default = "t2.micro"
}

variable "my-tag-name" {
    default = "my-default-name"
}

variable "az1" {
    default = "eu-west-1a"
}

variable "az2" {
    default = "eu-west-1b"
}


variable "my-ami-image" {
    default = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
}

variable "my-ami-owners" {
    default = "099720109477"
}

variable my-project-name{
  description = "Name of the project. Used in resource names and tags."
  type        = string
  default     = "default"
}
# owners      = ["amazon"]
# values = ["amzn2-ami-hvm-*-x86_64-gp2"]

