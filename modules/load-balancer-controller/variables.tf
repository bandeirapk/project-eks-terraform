variable "project_name" {
  description = "Project name to be used to name the resources (Name tag)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}