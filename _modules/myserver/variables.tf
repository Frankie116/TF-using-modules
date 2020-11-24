#-----------------------------------------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#-----------------------------------------------------------------
variable "my-region" {
}
variable "my-az" {
}

variable "my-instance-type" {
   default = "t2.micro"
}

variable "my-project-name"{
}

variable "my-existing-r53-zone" {
    default = "intracom.uk"
}

variable "my-servername" {
}

variable "my-scriptname" {
    default = "my-script.sh"
}
