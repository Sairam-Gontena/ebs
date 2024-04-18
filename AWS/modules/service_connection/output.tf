output "project_id" {
  value = data.azuredevops_project.project.id
}

output "service_connection_id" {
  value = azuredevops_serviceendpoint_aws.aws_connection.id
}
