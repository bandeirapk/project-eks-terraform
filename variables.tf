variable "cidr_block" {
  description = "Networking CIDR block to be used for the VPC"
  type        = string
}

variable "project_name" {
  description = "Project name to be used to name the resources (Name tag)"
  type        = string
}

variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}