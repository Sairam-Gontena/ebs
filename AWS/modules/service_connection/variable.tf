variable "azuredevops_org" {
  description = "Your Azure DevOps organization name"
  type        = string
}

variable "azuredevops_pat" {
  description = "Your Personal Access Token for Azure DevOps with appropriate permissions"
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
}

variable "project_name" {
  description = "Name of the Azure DevOps project"
  type        = string
}
