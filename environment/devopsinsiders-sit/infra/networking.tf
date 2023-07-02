module "networking" {
  source = "../../../modules/networking"

  # variables
  vpc_config     = var.vpc_config
  subnets_config = var.subnets_config
  vpc_name       = var.vpc_name
  rg_networking  = var.rg_networking
  location       = var.location
  tags           = var.tags
}
