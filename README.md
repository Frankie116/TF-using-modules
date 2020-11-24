# --------------------------
# lab035-aws-jenkins-server
# --------------------------


# --------------------------
## Part 1 Main Objectives
# --------------------------
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



# --------------------------
## Part 2 Feature Objectives
# --------------------------

[03] Auto install Jenkins on the server [Done]

[04] Save a Snapshot of the Jenkins server [Done]

[05] Enable a newly built server to use a restored snapshot with Jenkins, java & apache installed.  [Done]
        - Any Jenkins jobs created should also be shown on the newly restored server. [Done]

[06] Enable the same EIP to persist even after a Terraform destroy & re-apply [Done]

[07] Use Route53 to auto create dns record in specific Hosted Zone for Jenkins server during TF run [Done]

[08] Use dns name to connect to Jenkins Server [Done]

[09] Open Server SG to allow access to Jenkins server (port 8080) [Done]

[10] Manually complete Jenkins registration and start Application [Done]


# --------------------------
## Part 3 Feature Objectives
# --------------------------

[11] Refactor code - Use seperate Network and Server modules

[12] Enable multiple servers to be created on same network infrastructure

[13] Enable servers to be built using minimum reusable code.

[14] Enable Network components to be optionally built using enable variables in main code

[15] Introduce load balancing resources to be optionally built

[16] Introduce auto scaling resources to be optionally built


# --------------------------
## Part 4 Feature Objectives
# --------------------------

[17] Build two Jenkins servers that are load balanced and in autoscaling group

[18] configure Jenkins application as master/slave

[19] Setup Cloudwatch alarms

[20] Send email/text alerts based on Cloudwatch alarms


# --------------------------
## Part 5 Feature Objectives
# --------------------------

[21] Use Ansible to install Jenkins Application


# --------------------------
## Part 6 Feature Objectives
# --------------------------

[22] Build this project in Docker containers instead of individual aws resources

# --------------------------
## Pre Requisits
# --------------------------
The region where the server is to built needs to have the following existing AWS resources:
        - An elastic-ip named "my-eip-<region>"
        - A key-pair name "my-kp-eu-<region>"
        - A snapshot of a pre-configured server/backup named "my-snapshot-<region>"  
