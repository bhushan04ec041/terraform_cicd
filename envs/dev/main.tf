module "ec2" {
  source         = "../../modules/ec2"
  project_name   = var.project_name
  env            = var.env
  vpc_id         = var.vpc_id
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  key_name       = var.key_name
  tags           = var.tags
  ssh_allowed_ip = var.ssh_allowed_ip
}
