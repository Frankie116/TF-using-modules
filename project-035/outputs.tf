output "this_server_az" {
  description = "The AZ name of myec2 instance"
  value       = module.my-new-server.this_server_az
}


output "this_server_id" {
  description = "The id of myec2 instance"
  value       = module.my-new-server.this_server_id
}


output "this_server_private_ip" {
  value       = module.my-new-server.this_server_private_ip
}


output "this_eip_public_ip" {
  value       = module.my-new-server.this_eip_public_ip
}
