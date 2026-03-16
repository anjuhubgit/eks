module "vpc" {
    source = "C:/Users/souls/OneDrive/Documents/eks/eks/modules/vpc"
    #C:/Users/souls/OneDrive/Documents/eks/eks
    #azs = var.vpc_availability_zones
    availability_zone = var.vpc_availability_zones
    cidr_block = var.cidr_block
    #availability_zone = "ap-south-1a"
    
}

module "ecr" {
    source = "C:/Users/souls/OneDrive/Documents/terr_mod/modules/ecr"
    mutable = var.mutable
    encryption_type = var.encryption_type

    
    
}
module "iam" {
    source = "C:/Users/souls/OneDrive/Documents/terr_mod/modules/iam"
    
}


module "eks" {
    source = "C:/Users/souls/OneDrive/Documents/terr_mod/modules/eks"
    role = module.iam.role
    #subnet_id = module.vpc.aws_subnet.private.id
    vpc_id = module.vpc.vpc_id
    subnet_ids = [module.vpc.aws_subnet_private,
    module.vpc.aws_subnet_public]
    # role_arn = module.iam.aws_iam_role.cluster_role
    
}