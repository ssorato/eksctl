#
# credit: https://stackoverflow.com/questions/54802682/terraform-aws-ec2-ssh
#
data "http" "myip"{
  url = "https://ipv4.icanhazip.com"
}

locals {
  ssh_ingress = [
    {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = "${chomp(data.http.myip.body)}/32"
      description = "Enable ssh incoming traffic from my public ip"
    },
    {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = var.vpc_cidr
      description = "Enable ssh incoming traffic from the VPC"
    },
    {
      protocol    = "icmp"
      from_port   = 8
      to_port     = 0
      cidr_blocks = var.vpc_cidr
      description = "Enable ping incoming traffic from the VPC"
    }
  ]
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.lab_name}-vpc"
  cidr = var.vpc_cidr

  manage_default_security_group   = true
  default_security_group_egress   = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = "0.0.0.0/0"
      description = "Enable all output traffic"
    }
  ]
  default_security_group_ingress  = local.ssh_ingress
  default_security_group_name     = "${var.lab_name}-sg"

  azs             = [var.az1, var.az2]
  # private subnets without Internet routing
  private_subnets   = [var.private_subnet1, var.private_subnet2]
  public_subnets  = [var.public_subnet1, var.public_subnet2]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = false
  one_nat_gateway_per_az = true

  tags = var.common_tag

  default_security_group_tags = var.common_tag

  # eks tags
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb": 1
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb": 1
  }
}