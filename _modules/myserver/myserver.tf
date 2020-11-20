resource "aws_vpc" "my-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "My-VPC-034"
  }
}


resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.my-vpc.id
   tags = {
    Name = "My-GW-034"
  }
}

resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gw.id
  }
  tags = {
    Name = "My-RT-034"
  }
}

resource "aws_route_table_association" "my-rt-association" {
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}

resource "aws_subnet" "my-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.my-az
  tags = {
    Name = "My-Subnet-034"
  }
  # map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.my-gw]
}


resource "aws_security_group" "my-security-group" {
  name        = "my-security-group-name"
  description = "Allow inbound SSH, HTTP & HTTPS traffic"
  vpc_id      = aws_vpc.my-vpc.id
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ingress {
  #   description = "Jenkins"
  #   from_port   = 8080
  #   to_port     = 8080
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "My-Security-Group-034"
  }
}


resource "aws_network_interface" "my-server-nic" {
  subnet_id   = aws_subnet.my-subnet.id
  private_ips = ["10.0.1.50"]
  security_groups = [aws_security_group.my-security-group.id]

  tags = {
    Name = "My-Server-NIC-034"
  }
}

data "aws_eip" "my-eip" {
  filter {
    name   = "tag:Name"
    values = [var.my-existing-eip]
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my-server.id
  allocation_id = data.aws_eip.my-eip.id
}


resource "aws_instance" "my-server" {
  ami           = data.aws_ami.my-ami.id
  instance_type = var.my-instance-type
  availability_zone = var.my-az
  key_name = var.my-keypair

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.my-server-nic.id
  }

  user_data = <<-EOF
              #!/bin/bash

              sudo apt update -y           
              sudo apt install apache2 -y
              sudo apt-get install default-jre -y
              sudo apt-get install default-jdk
              wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
              echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list
              sudo apt-get update -y
              sudo apt-get -y install jenkins
              sudo cat /var/lib/jenkins/secrets/initialAdminPassword


              sudo yum update -y
              sudo yum install httpd -y
              sudo yum install default-jre
              sudo yum install default-jdk


              sudo systemctl enable httpd
              sudo systemctl start httpd
              sudo systemctl start apache2
              sudo systemctl start jenkins

              sudo systemctl status jenkins
              java -version
              echo "<html><body><div>Welcome to the Jenkins Server.  Hostname :$(hostname -f) </div></body></html>" > /var/www/html/index.html
              EOF
  tags          = {
    Name        = var.my-tag-name
    Project     = var.my-project-name
  }
}


data "aws_ami" "my-ami" {
  most_recent = true
  owners = [var.my-ami-owners]

  filter {
    name   = "name"
    values = var.my-ami-image
  }
}


# resource "aws_route53_zone" "primary" {
#   name = "intracom.uk"
# }
# resource "aws_route53_record" "jenkins1" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "jenkins3.intracom.uk"
#   type    = "A"
#   ttl     = "300"
#   records = [data.aws_eip.my-eip.public_ip]
# }




