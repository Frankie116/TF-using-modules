20/11/20

Changelog-010
Module updated to use an existing EIP with tag Name = "my-default-eip"
Module could also use an existing EIP that has the same tag as one specified in terraform.tfvars file (var.my-existing-eip = "my-other-eip")

Changelog-011
Enabled route53 record to be created in a specific dns hosted zone using specific servname
Servername & hosted zone is configured in terraform.tfvars
Servers DNS record is associated to server's elastic IP
Appended the project name to all resource tags.
Updated the default keypair name to be "<project-name>-keypair".  therefore no need to specify in terraform.tfvars.
