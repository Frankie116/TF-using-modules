


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
  value       = data.aws_eip.my-eip.public_ip
}





