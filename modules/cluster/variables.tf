variable "project_name" {
  description = "Project name to be used to name the resources (Name tag)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "public_subnet_1a" {
  description = "Public subnet in the first availability zone to deploy the EKS cluster"
  type        = string
}


variable "public_subnet_1b" {
  description = "Public subnet in the first availability zone to deploy the EKS cluster"
  type        = string
}