module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  tags        = local.tags
  
  
}
module "s3" {
  source      = "./modules/s3"
  tags        = local.tags
  
  
}
module "ec2" {
  source      = "./modules/ec2"
  public_subnets_ids  = module.vpc.public_subnets_ids
  private_subnets_ids = module.vpc.private_subnets_ids
  sg_bastion_host_id = module.sg.sg_bastion_host_id
  sg_private_instance_id = module.sg.sg_private_instance_id
  region            = var.region
  eip_id = module.vpc.eip_id
  iam_instance_profile_name = module.iam.ec2_instance_profile_name
  tags        = local.tags

}
module "sg" {
  source = "./modules/sg"
  tags   = local.tags
  vpc_id = module.vpc.vpc_id
}
module "iam" {
  source = "./modules/iam"
  tags=local.tags

}