BRANCH "master" 
Changelog-010 [Objective 06]
Module updated to use an existing EIP with tag Name = "my-default-eip"
Module could also use an existing EIP that has the same tag as one specified in terraform.tfvars file (var.my-existing-eip = "my-other-eip")

Changelog-011 [Objective 07,08,09,00]
Enabled route53 record to be created in a specific dns hosted zone using specific servname
Servername & hosted zone is configured in terraform.tfvars
Servers DNS record is associated to server's elastic IP
Appended the project name to all resource tags.
Updated the default keypair name to be "<project-name>-keypair".  therefore no need to specify in terraform.tfvars.

Changelog-012 [Objective 00]
Created seperate script files which are called by the module instead of having the code embedded within the module.

Changelog-013 [Objective 05]
Created a snapshot of server after the jenkins registration was completed and a few jenkins jobs were created.
Created an aws volume using this snapshot.
Reconfigured terraform module to use this snapshot when building infrastructure
    However, the newly built server can only use the snapshot as an additional drive and not the boot drive at the moment.




BRANCH "snapshot" 
Changelog-001 [Objective05]
Removed code to build server from a standard amazon/ubuntu ami. (ubuntu/amazon scripts no longer used)
Refactored code to build server from an existing customized snapshot called "my-snapshot-latest" 
    This snapshot should be a backup of a working jenkins server including user data.
    This snapshot needs to be found in the same region as the newly built server

Changelog-002 [Objective05,00]
Updated the default keypair name to be "my-kp-<region>".  therefore no need to specify in terraform.tfvars.
Updated the default eip name to be "my-eip-<servername>".  therefore no need to specify in terraform.tfvars. 
seperated the modules into network & server.
Network module contains the following code: 
    - VPC
    - IGW
    - Route Table
    - Route Table Association
    - Subnet
    - Route53
Server Module contains the following code:
    - Security Group
    - NIC
    - EIP
    - EIP Association
    - Snapshot
    - Ami
    - Ec2 Instance
    - Script




    
    
    
        


