locals {
  members = var.team
  environment = var.environment
  resource_name_prefix = "${var.team}-${var.environment}"

  common_tags = {
      members = local.members
      environment = local.environment
  }
}