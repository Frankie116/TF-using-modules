#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------
variable "my-region" {
    default = "eu-west-2"
}
variable "my-az" {
    default = "us-west-2a"
}

variable "my-instance-type" {
   default = "t2.micro"
}

variable "my-project-name"{
  type        = string
  default     = "default"
}

variable "my-existing-r53-zone" {
    default = "intracom.uk"
}

variable "my-servername" {
    default = "default-server"
}

variable "my-scriptname" {
    default = "my-script.sh"
}
