


output "this_server_az" {
  description = "The AZ name of myec2 instance"
  value       = aws_instance.my-server.availability_zone
}


output "this_server_id" {
  description = "The id of myec2 instance"
  value       = aws_instance.my-server.id
}


output "this_server_public_ip" {
  description = "The public ip of myec2 instance"
  value       = aws_instance.my-server.public_ip
}


output "this_server_private_ip" {
  value       = aws_instance.my-server.private_ip
}


output "this_eip_public_ip" {
  value       = aws_eip.my-eip.public_ip
}


output "this_eip_private_ip" {
  description = "The private ip associated to eip"
  value       = aws_eip.my-eip.associate_with_private_ip
}


output "this_eip_dns" {
  description = "The dns of eip"
  value       = aws_eip.my-eip.public_dns
}

# output "this_ami_image" {
#   description = "The ami on this server"
#   value       = aws_ami.my-ami.id
# }


# output "this_tag_name" {
#   description = "The tag name of myec2 instance"
#   value       = aws_instance.myec2.tags[my-tag-name]  //find out how to output tag name
# }





