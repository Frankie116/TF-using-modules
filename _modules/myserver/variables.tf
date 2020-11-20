variable "region" {
    default = "eu-west-1"
}
variable "my-az" {
    default = "eu-west-1a"
}

variable "my-instance-type" {
   default = "t2.micro"
}

variable "my-tag-name" {
    default = "my-default-name"
}

variable "my-ami-image" {
    default = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
}

variable "my-ami-owners" {
    default = "099720109477"
}

variable "my-project-name"{
  description = "Name of the project. Used in resource names and tags."
  type        = string
  default     = "default"
}

variable "my-keypair" {
    default = "my-london-key"
}

variable "my-existing-eip" {
    default = "my-default-eip"
}