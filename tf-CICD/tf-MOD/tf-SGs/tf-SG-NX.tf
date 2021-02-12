resource "aws_security_group" "NX-SG" {
  name        = "NX-ASG"
  description = "Allow ssh/rdp inbound traffic"
  vpc_id      = var.cicd-vpc-id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.NX-p22-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = var.NX-p8081-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.NX-pj-i-cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NX-SG"
  }
}