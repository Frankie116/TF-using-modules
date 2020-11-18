# --------------------------------------------------------------------------
# lab035-aws-jenkins-server
# --------------------------------------------------------------------------


# -------------------
## Part 1 Objectives
# -------------------

[01] Create terraform modules to enable the following AWS resources to be built:
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

[02] Execute a Terraform run to build the above resources with Java & Apache installed on the EC2



# -------------------
## Part 2 Objectives
# -------------------

[03] Auto install Jenkins on the server

[04] Save a Snapshot of the Jenkins server

[05] Enable a newly built server to use a snapshot with Jenkins, java & apache installed

[06] Enable the same EIP to persist even after a Terraform destroy & re-apply

[07] Use Route53 to register Jenkins server dns name

[08] Use dns name to connect to Jenkins Server



# -------------------
## Part 3 Objectives
# -------------------

[09] Build a second Jenkins server and configure them as master/slave


# -------------------
## Part 4 Objectives
# -------------------

[10] Build this project in Docker containers instead of individual aws resources


