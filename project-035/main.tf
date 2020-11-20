# Terraform configuration

module "my-new-server" {
  source            = "../_modules/myserver"
  my-az             = var.my-az
  my-ami-image      = var.my-ami-image
  my-ami-owners     = var.my-ami-owners
  my-tag-name       = var.my-tag-name
  my-project-name   = var.my-project-name
  my-keypair        = var.my-keypair
  my-existing-eip   = var.my-existing-eip
}

