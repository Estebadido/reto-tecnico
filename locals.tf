locals {
    tags = {
        Environment = var.evironment
        Project     = var.project
        Owner       = var.owner
        Region      = var.region
    }
}