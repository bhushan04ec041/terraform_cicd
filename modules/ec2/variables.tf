variable "project_name" {}
variable "env" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "instance_type" { default = "t2.micro" }
variable "key_name" {}
variable "tags" {
  type    = map(string)
  default = {}
}

variable "ssh_allowed_ip" {
  description = "IP address allowed to SSH into EC2"
  type        = string
}
