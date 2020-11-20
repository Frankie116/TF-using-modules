#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------

output "this_server_fqdn" {
  value       = aws_route53_record.my-r53-record.fqdn
}
output "this_server_az" {
  value       = aws_instance.my-server.availability_zone
}

output "this_eip_public_ip" {
  value       = data.aws_eip.my-eip.public_ip
}
output "this_server_private_ip" {
  value       = aws_instance.my-server.private_ip
}







