#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------
variable "region" {
    default = "eu-west-1"
}
variable "my-az" {
    default = "eu-west-1a"
}

variable "my-instance-type" {
   default = "t2.micro"
}

variable "my-ami-image" {
    default = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
}

variable "my-ami-owners" {
    default = "099720109477"
}

variable "my-project-name"{
  type        = string
  default     = "default"
}

variable "my-existing-eip" {
    default = "my-default-eip"
}

variable "my-existing-r53-zone" {
    default = "intracom.uk"
}

variable "my-servername" {
    default = "default-server"
}

variable "my-device-name" {
    default = "default-device-name"
}

variable "my-scriptname" {
    default = "my-ubuntu-script.sh"
}