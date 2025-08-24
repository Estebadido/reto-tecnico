module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  tags        = local.tags
  
  
}
module "s3" {
  source      = "./modules/s3"
  tags        = local.tags
  
  
}