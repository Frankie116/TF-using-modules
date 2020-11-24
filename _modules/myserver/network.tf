#-----------------------------------------------------------------
# Project: AWS-Jenkins-Server
# Author:  Frank Effrim-Botchey
#-----------------------------------------------------------------

resource "aws_vpc" "my-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name               = "${var.my-project-name}-VPC"
  }
}

resource "aws_internet_gateway" "my-gw" {
  vpc_id              = aws_vpc.my-vpc.id
   tags               = {
    Name              = "${var.my-project-name}-GW"
  }
}

resource "aws_route_table" "my-route-table" {
  vpc_id              = aws_vpc.my-vpc.id
  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id        = aws_internet_gateway.my-gw.id
  }
  tags                = {
    Name              = "${var.my-project-name}-RT"
  }
}

resource "aws_route_table_association" "my-rt-association" {
  subnet_id           = aws_subnet.my-subnet.id
  route_table_id      = aws_route_table.my-route-table.id
}

resource "aws_subnet" "my-subnet" {
  vpc_id              = aws_vpc.my-vpc.id
  cidr_block          = "10.0.1.0/24"
  availability_zone   = var.my-az
  tags = {
    Name              = "${var.my-project-name}-Subnet"
  }
  depends_on          = [aws_internet_gateway.my-gw]
}

data "aws_route53_zone" "my-r53zone" {
  name                = var.my-existing-r53-zone
}

resource "aws_route53_record" "my-r53-record" {
  zone_id             = data.aws_route53_zone.my-r53zone.zone_id
  name                = "${var.my-servername}.${data.aws_route53_zone.my-r53zone.name}"
  type                = "A"
  ttl                 = "300"
  records             = [data.aws_eip.my-eip.public_ip]
}







