resource "aws_security_group" "SQ-SG" {
  name        = "SQ-ASG"
  description = "Allow ssh/rdp inbound traffic"
  vpc_id      = var.cicd-vpc-id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.SQ-p22-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.SQ-p80-i-cidrs
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.SQ-pj-i-cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SQ-SG"
  }
}