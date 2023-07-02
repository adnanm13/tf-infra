module "activeDirectory" {
  source = "../../../modules/activeDirectory"

  # variables
  ad_domain     = var.ad_domain
  vpc_name      = var.vpc_name
  location      = var.location
  rg_workspace  = var.rg_workspace
  rg_networking = var.rg_networking
  ad_subnet     = var.ad_subnet
  tags          = var.tags
}