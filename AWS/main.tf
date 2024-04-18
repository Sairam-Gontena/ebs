module "elastic-beanstalk-single-instance" {
  source = "./modules/elastic-beanstalk-single-instance/"

  region_primary = var.region_primary
  access_key     = var.access_key
  secret_key     = var.secret_key
  application    = var.application
  environment    = var.environment
  
}
module "spn" {
  source                = "./modules/service_connection"
  project_name = var.project_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  subscription_id = data.azurerm_client_config.current.subscription_id
  subscription_name = "Azure Subscription"
}
module "pipelines" {
  source                = "./modules/build_pipelines"
  name = var.repo_name
  appservice_name = module.app.name
  folder = "${var.env}-${var.name}-${var.app}"
  branch = var.branch
  service_connection = module.spn.spn_name
  acr_spn = module.spn.acr_spn_name
  acr_login = module.azure_container_registry.login
  project_name = var.project_name
  env_name = var.env
  email = var.email
  product_id = var.product_id
  title = var.title
  notify_url = var.notify_url
}