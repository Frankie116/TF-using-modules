#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------

module "my-new-server" {
  source            = "../_modules/myserver"
  my-az             = var.my-az
  my-ami-image      = var.my-ami-image
  my-ami-owners     = var.my-ami-owners
  my-project-name   = var.my-project-name
  my-existing-eip   = var.my-existing-eip
  my-servername     = var.my-servername 
}

