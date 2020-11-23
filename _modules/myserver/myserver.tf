#------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#------------------------------

resource "aws_vpc" "my-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name               = "${var.my-project-name}-VPC"
  }
}

resource "aws_internet_gateway" "my-gw" {
  vpc_id  = aws_vpc.my-vpc.id
   tags   = {
    Name  = "${var.my-project-name}-GW"
  }
}

resource "aws_route_table" "my-route-table" {
  vpc_id        = aws_vpc.my-vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.my-gw.id
  }
  tags = {
    Name        = "${var.my-project-name}-RT"
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
    Name = "${var.my-project-name}-Subnet"
  }
  depends_on        = [aws_internet_gateway.my-gw]
}


resource "aws_security_group" "my-security-group" {
  name          = "${var.my-project-name}-Security-Group"
  description   = "Allow inbound SSH, HTTP & HTTPS traffic"
  vpc_id        = aws_vpc.my-vpc.id
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
  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.my-project-name}-Security-Group"
  }
}

resource "aws_network_interface" "my-server-nic" {
  subnet_id       = aws_subnet.my-subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.my-security-group.id]

  tags            = {
    Name          = "${var.my-project-name}-Server-NIC"
  }
}

data "aws_eip" "my-eip" {
  filter {
    name          = "tag:Name"
    values        = ["my-eip-${var.my-region}"]
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my-server.id
  allocation_id = data.aws_eip.my-eip.id
}


data "template_file" "my-template" {
  template            = file(var.my-scriptname)

  vars                = {
    my-scriptname     = var.my-scriptname
  }
}

data "aws_ebs_snapshot" "my-existing-snapshot" {
  most_recent         = true
  owners              = ["self"]

  filter {
    name              = "tag:Name"
    values            = ["my-snapshot-latest"]
  }
}


resource "aws_ami" "my-ami" {
  name                = "my-new-ami"
  virtualization_type = "hvm"
  root_device_name    = "/dev/sda1"

  ebs_block_device {
    snapshot_id       = data.aws_ebs_snapshot.my-existing-snapshot.id
    device_name       = "/dev/sda1"
  }
}

resource "aws_instance" "my-server" {
  ami                 = aws_ami.my-ami.id
  instance_type       = var.my-instance-type
  availability_zone   = var.my-az
  key_name            = "my-kp-${var.my-region}"
  user_data           = data.template_file.my-template.rendered


  network_interface {
    device_index      = 0
    network_interface_id = aws_network_interface.my-server-nic.id
  }

  tags          = {
    Name        = var.my-servername
    Project     = var.my-project-name
  }
}

data "aws_route53_zone" "my-r53zone" {
  name         = var.my-existing-r53-zone
}

resource "aws_route53_record" "my-r53-record" {
  zone_id     = data.aws_route53_zone.my-r53zone.zone_id
  name        = "${var.my-servername}.${data.aws_route53_zone.my-r53zone.name}"
  type        = "A"
  ttl         = "300"
  records     = [data.aws_eip.my-eip.public_ip]
}





