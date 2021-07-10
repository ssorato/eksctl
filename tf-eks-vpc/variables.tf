variable "lab_name" {
  type = string
  description = "Lab name"
}

variable "az1" {
  type = string
  description = "Availability Zone 1"
}

variable "az2" {
  type = string
  description = "Availability Zone 2"
}

variable "vpc_cidr" {
  type = string
  description = "The VPC CIDR"
}

variable "public_subnet1" {
type = string
description = "Public subnet 1"
}

variable "public_subnet2" {
  type = string
  description = "Public subnet 2"
}

variable "private_subnet1" {
  type = string
  description = "Private subnet 1"
}

variable "private_subnet2" {
  type = string
  description = "Private subnet 2"
}

variable "common_tag" {
  type = map(string)
  description = "Common resource tags"
}
