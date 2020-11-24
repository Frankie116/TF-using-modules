#-----------------------------------------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#-----------------------------------------------------------------

module "my-new-server-01" {
  source            = "../_modules/myserver"
  my-region         = var.my-region
  my-az             = var.my-az
  my-project-name   = var.my-project-name
  my-servername     = var.my-servername 
}

module "my-new-server-02" {
  source            = "../_modules/myserver"
  my-region         = var.my-region
  my-az             = var.my-az
  my-project-name   = var.my-project-name
  my-servername     = "jenkins02"
  my-scriptname     = "my-script2.sh"
}