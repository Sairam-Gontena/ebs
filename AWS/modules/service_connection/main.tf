data "azuredevops_project" "project" {
  name = var.project_name  # Ensure this variable matches the exact name of your existing project
}
resource "azuredevops_serviceendpoint_aws" "aws_connection" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = "aws_spn"
  description           = "AWS service connection managed by Terraform"
  access_key_id         = var.aws_access_key_id
  secret_access_key     = var.aws_secret_access_key

  # Optional: specify if using a role to assume
  # assume_role_arn       = "arn:aws:iam::123456789012:role/YourRoleName"
  # assume_role_session_name = "AzureDevOpsSession"
}
