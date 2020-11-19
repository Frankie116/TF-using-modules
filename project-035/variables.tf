# Input variable definitions

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

variable "my-tag-name" {
    default = "my-default-name"
}

variable "my-project-name" {
  description = "Name of the project. Used in resource names and tags."
  type        = string
  default     = "default"
}

variable "my-keypair" {
    default = "my-london-key"
}