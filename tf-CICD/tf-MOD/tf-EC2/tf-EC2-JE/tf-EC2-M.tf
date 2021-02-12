resource "aws_instance" "JE" {
  ami = var.ami_id
  instance_type = var.i_type
  associate_public_ip_address = true
  key_name = var.i-kp
  vpc_security_group_ids = [var.i-sg]
  iam_instance_profile = "SSM-exp-A-tf"
  user_data = file("../tf-MOD/tf-EC2/tf-EC2-JE/jenkins-setup.sh")
  subnet_id =var.i-sbnt-id
  root_block_device {
    volume_size = var.i-vs
    volume_type = var.i-vt
    delete_on_termination = true
  }
tags = {
    Name = var.i-name
  }
}

resource "aws_volume_attachment" "extra_v_attachement" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.JE.id
  volume_id = aws_ebs_volume.extra_v.id
}

resource "aws_ebs_volume" "extra_v" {
  availability_zone = aws_instance.JE.availability_zone
  size            = var.i-xvs

  tags = {
    Name = var.i-name
  }
}
