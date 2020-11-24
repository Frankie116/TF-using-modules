# --------------------------
# lab035-aws-jenkins-server
# --------------------------


# -------------------
## Part 1 Objectives
# -------------------
[00] Build/refactor code that is re-usable and streamlined

[01] Create terraform modules to enable the following AWS resources to be built on a terraform run: [Done]

    - EC2 Instance 

    - Network Interface 

    - Elastic IP 

    - AMI - Ubuntu or Amazon Linux 2 

    - VPC 

    - Internet Gateway

    - Route Table

    - Route Table Association

    - Subnet

    - Security Group (allow http, https & ssh)

[02] Execute a Terraform run to build the above resources with Java & Apache installed on the EC2 [Done]



# -------------------
## Part 2 Objectives
# -------------------

[03] Auto install Jenkins on the server [Done]

[04] Save a Snapshot of the Jenkins server

[05] Enable a newly built server to use a restored snapshot with Jenkins, java & apache installed.  
        - Any Jenkins jobs created should also be shown on the newly restored server.

[06] Enable the same EIP to persist even after a Terraform destroy & re-apply [Done]

[07] Use Route53 to auto create dns record in specific Hosted Zone for Jenkins server during TF run [Done]

[08] Use dns name to connect to Jenkins Server [Done]

[09] Open Server SG to allow access to Jenkins server (port 8080) [Done]

[10] Manually complete Jenkins registration and start Application [Done]



# -------------------
## Part 3 Objectives
# -------------------

[09] Use Ansible to complete Auto complete Jenkins registration and start Application

[09] Build a second Jenkins server and configure them as master/slave


# -------------------
## Part 4 Objectives
# -------------------

[10] Build this project in Docker containers instead of individual aws resources




# -------------------
## Pre Requisits
# -------------------
The region where the server is to built needs to have the following existing AWS resources:
        - An elastic-ip named "my-eip-<region>"
        - A key-pair name "my-kp-eu-<region>"
        - A snapshot of a pre-configured server/backup named "my-snapshot-<region>"  
