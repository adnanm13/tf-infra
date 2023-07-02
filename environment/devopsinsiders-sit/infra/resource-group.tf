module "resource_groups" {
  source = "../../../modules/resourceGroups"

  # variables
  resource_groups_config = var.resource_groups_config
  tags                   = var.tags
}