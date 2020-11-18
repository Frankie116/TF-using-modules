
output "this_server_az" {
  description = "The AZ name of myec2 instance"
  value       = module.my-new-server.this_server_az
}


output "this_server_id" {
  description = "The id of myec2 instance"
  value       = module.my-new-server.this_server_id
}


output "this_server_public_ip" {
  description = "The public ip of myec2 instance"
  value       = module.my-new-server.this_server_public_ip
}


output "this_server_private_ip" {
  value       = module.my-new-server.this_server_private_ip
}


# output "this_ami_image" {
#   description = "The ami on this server"
#   value       = module.my-new-server.this_ami_image
# }

# output "this_eip_public_ip" {
#   value       = module.my-new-eip.this_eip_public_ip
# }


# output "this_eip_private_ip" {
#   description = "The private ip associated to eip"
#   value       = module.my-new-eip.this_eip_private_ip
# }


# output "this_eip_dns" {
#   description = "The dns of eip"
#   value       = module.my-new-eip.this_eip_dns
# }










# output "this_tag_name" {
#   description = "The tag name of myec2 instance"
#   value       = module.my-new-server.tags[my-tag-name]  //find out how to output tag name
# }





