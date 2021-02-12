module "P-VPC" {
  source = "../tf-MOD/tf-VPC"
  region = var.prov-region
  vpc_cidr = var.p-vpc-cidr
}

module "P-SGs" {
  source = "../tf-MOD/tf-SGs"

  cicd-vpc-id = module.P-VPC.cicd-vpc.id

  NX-p22-i-cidrs = ["${var.my-ipc}/32"]
  NX-p8081-i-cidrs = ["${var.my-ipc}/32"]
  NX-pj-i-cidrs = ["54.92.154.221/32"]  ##replace with ##1# after the first run for the second and final run

  SQ-p22-i-cidrs = ["${var.my-ipc}/32"]
  SQ-p80-i-cidrs = ["${var.my-ipc}/32"]
  SQ-pj-i-cidrs = ["54.92.154.221/32"]  ##replace with ##1# after the first run for the second and final run

  j-p22-i-cidrs = ["${var.my-ipc}/32"]
  j-p8080-i-cidrs = ["${var.my-ipc}/32"]
  j-pNX-i-cidrs = ["54.146.39.148/32"]  ##replace with ##2# after the first run for the second and final run
  j-pSQ-i-cidrs = ["34.207.248.99/32"]  ##replace with ##3# after the first run for the second and final run

  ##1# "${module.P-EC2-JE.i-JE-O.public_ip}/32" from the terminal output
  ##2# "${module.P-EC2-NX.i-NX-O.public_ip}/32" from the terminal output
  ##3# "${module.P-EC2-SQ.i-SQ-O.public_ip}/32" from the terminal output
}

module "P-EC2-JE" {
  source = "../tf-MOD/tf-EC2/tf-EC2-JE"
  ami_id = var.i-je-ami
  i-kp = var.i-p-kp
  i-name = "JE"
  i-sbnt-id = module.P-VPC.subnet2.id
  i-sg = module.P-SGs.JE-ASG.id
  i-vs = 15
  i-vt = "gp2"
  i-xvs = 5
  i_type = var.i-je-nx-sq-type
}

module "P-EC2-NX" {
  source = "../tf-MOD/tf-EC2/tf-EC2-NX"
  ami_id = var.i-nx-ami
  i-kp = var.i-p-kp
  i-name = "NX"
  i-sbnt-id = module.P-VPC.subnet2.id
  i-sg = module.P-SGs.NX-ASG.id
  i-vs = 15
  i-vt = "gp2"
  i-xvs = 5
  i_type = var.i-je-nx-sq-type
}

module "P-EC2-SQ" {
  source = "../tf-MOD/tf-EC2/tf-EC2-SQ"
  ami_id = var.i-sq-ami
  i-kp = var.i-p-kp
  i-name = "SQ"
  i-sbnt-id = module.P-VPC.subnet2.id
  i-sg = module.P-SGs.SQ-ASG.id
  i-vs = 15
  i-vt = "gp2"
  i-xvs = 5
  i_type = var.i-je-nx-sq-type
}