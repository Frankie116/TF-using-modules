#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------

module "my-new-server" {
  source            = "../_modules/myserver"
  my-region         = var.my-region
  my-az             = var.my-az
  my-project-name   = var.my-project-name
  my-servername     = var.my-servername 
}

