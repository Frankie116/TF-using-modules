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

variable "my-ami-image" {
}

variable "my-ami-owners" {
}

variable "my-project-name" {
  default     = "default"
}

variable "my-existing-eip" {
    default = "my-default-eip"
}

variable "my-servername" {
}