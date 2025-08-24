module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  tags        = local.tags
  
  
}