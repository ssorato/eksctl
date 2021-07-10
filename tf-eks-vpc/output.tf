output "azs" {
  description = "Availability Zones"
  value = module.vpc.azs
}

output "vpc_id" {
  description = "The ID of the VPC"
  value = module.vpc.vpc_id
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value = module.vpc.default_security_group_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value = module.vpc.vpc_main_route_table_id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value = module.vpc.intra_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value = module.vpc.public_route_table_ids
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value = module.vpc.igw_id
}
