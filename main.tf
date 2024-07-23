module "application" {
  source           = "./modules/application"
  app_name         = var.app_name
}

module "newrelic_alert" {
  source           = "./modules/alert_policy"
  application_id = module.application.application_ids   
  condition_name = var.condition_name
  policy_name = var.policy_name
}
