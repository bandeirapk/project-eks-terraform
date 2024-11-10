variable "project_name" {
  description = "Project name to be used to name the resources (Name tag)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "private_subnet_1a" {
  description = "Private subnet in the first availability zone to deploy the EKS cluster"
  type        = string
}

variable "private_subnet_1b" {
  description = "Private subnet in the first availability zone to deploy the EKS cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}