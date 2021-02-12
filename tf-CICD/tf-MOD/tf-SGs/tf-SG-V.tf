variable "cicd-vpc-id" {
  type = string
  description = "vpc to attach SGs to"
}
###--JE--
variable "j-p22-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "j-p8080-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "j-pNX-i-cidrs" {
  type = list(string)
  description = "nx ip"
}
variable "j-pSQ-i-cidrs" {
  type = list(string)
  description = "sq ip"
}

###--NX--
variable "NX-p22-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "NX-p8081-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "NX-pj-i-cidrs" {
  type = list(string)
  description = "je ip"
}

###--SQ--
variable "SQ-p22-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "SQ-p80-i-cidrs" {
  type = list(string)
  description = "my ip"
}
variable "SQ-pj-i-cidrs" {
  type = list(string)
  description = "je ip"
}