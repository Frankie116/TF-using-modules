# Terraform configuration

module "my-new-server" {
  source = "../_modules/myserver"
  my-tag-name = "my-jenkins-server"
}

