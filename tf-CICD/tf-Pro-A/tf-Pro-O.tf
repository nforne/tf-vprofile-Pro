output "P-VPC" {
  value = module.P-VPC
}
output "P-SGs" {
  value = module.P-SGs
}
output "P-EC2-JE" {
  value = module.P-EC2-JE.i-JE-O.public_ip
}
output "P-EC2-NX" {
  value = module.P-EC2-NX.i-NX-O.public_ip
}
output "P-EC2-SQ" {
  value = module.P-EC2-SQ.i-SQ-O.public_ip
}