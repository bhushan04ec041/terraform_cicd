resource "aws_security_group" "this" {
  name        = "${var.project_name}-${var.env}-sg"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

 ingress {
  description = "Allow SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.ssh_allowed_ip}/32"]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.env}-sg"
  })
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name      = var.key_name
  
  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.env}-ec2"
  })
}

