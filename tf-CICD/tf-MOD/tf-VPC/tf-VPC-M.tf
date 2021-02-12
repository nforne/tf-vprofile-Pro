resource "aws_vpc" "cicd-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name= "cicd-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cicd-vpc.id

  tags = {
    Name = "igw-cicd-vpc"
  }
}
resource "aws_subnet" "subnet1" {
  cidr_block = cidrsubnet(var.vpc_cidr,8 ,0 )
  vpc_id = aws_vpc.cicd-vpc.id
  availability_zone = "${var.region}b"
  tags = {
    Name = "subnet1"
  }
}
resource "aws_route_table_association" "rt1asso" {
  route_table_id = aws_route_table.rt1.id
  subnet_id = aws_subnet.subnet1.id
}
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.cicd-vpc.id
  tags = {
    Name = "rt1"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = cidrsubnet(var.vpc_cidr,8 ,1 )
  vpc_id = aws_vpc.cicd-vpc.id
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnet2"
  }
}
resource "aws_route_table_association" "rt2asso" {
  route_table_id = aws_route_table.rt2.id
  subnet_id = aws_subnet.subnet2.id
}
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.cicd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt2"
  }
}




