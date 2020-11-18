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




# variable "private_ip" {
#     default = "99.99.99.99"
# }

# variable "subnet_id" {
#     default = "9.9.9.9/9"
# }

# variable "network_interface_id" {
#     default = "9999888777"
# }