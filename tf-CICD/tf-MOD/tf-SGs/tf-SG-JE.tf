resource "aws_security_group" "JE-SG" {
  name        = "JE-ASG"
  description = "Allow ssh/rdp inbound traffic"
  vpc_id      = var.cicd-vpc-id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.j-p22-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.j-p8080-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.j-pNX-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.j-pSQ-i-cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "JE-SG"
  }
}