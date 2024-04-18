data "azuredevops_project" "project" {
  name               = var.project_name
}
data "azuredevops_git_repository" "repo" {
  project_id = data.azuredevops_project.project.id
  name       = var.name
}
resource "azuredevops_build_definition" "pipeline" {
  project_id = data.azuredevops_project.project.id
  name       = var.name
  path       = "\\${var.folder}"
  repository {
    repo_type = "TfsGit"
    repo_id     = data.azuredevops_git_repository.repo.id
    branch_name = var.branch
    yml_path    = "./frontend/azure-pipeline.yml"
  }
  ci_trigger {
    override {
      branch_filter{
        include = ["${var.branch}"]
      }
    }
  }
  variable {
    name  = "aws_spn"
    value = var.aws_spn
  }

  variable {
    name  = "service_connection"
    value = var.service_connection
  }

  variable {
    name  = "branch"
    value = var.branch
  }
  variable {
    name = "name"
    value = var.name
  }
  variable {
    name = "env"
    value = var.env_name
  }
  variable {
    name = "email"
    value = var.email
  }

  variable {
    name = "product_id"
    value = var.product_id
  }
  variable {
    name = "title"
    value = var.title
  }
    variable {
    name = "notify_url"
    value = var.notify_url
  }
}