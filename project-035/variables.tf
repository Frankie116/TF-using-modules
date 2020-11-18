# Input variable definitions

variable "region" {
    default = "eu-west-2"
}

variable "az1" {
    default = "eu-west-1a"
}

variable "az2" {
    default = "eu-west-1b"
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