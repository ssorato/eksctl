lab_name        = "eksnet"

az1             = "us-east-1a"
az2             = "us-east-1b"

vpc_cidr        = "192.168.231.0/24"

public_subnet1  = "192.168.231.0/26"
public_subnet2  = "192.168.231.64/26"
private_subnet1 = "192.168.231.128/26"
private_subnet2 = "192.168.231.192/26"

common_tag      = {
    Terraform = "terraform-eks-vpc"
    Environment = "eksnet"
}

