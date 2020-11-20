#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------
output "this_server_fqdn" {
  value = module.my-new-server.this_server_fqdn
}

output "this_server_az" {
  value = module.my-new-server.this_server_az
}

output "this_eip_public_ip" {
  value = module.my-new-server.this_eip_public_ip
}
output "this_server_private_ip" {
  value = module.my-new-server.this_server_private_ip
}



