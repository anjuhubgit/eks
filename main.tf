module "vpc" {
    source = "C:/Users/souls/OneDrive/Documents/terr_mod/modules/vpc"
    
}

module "ecr" {
    source = "C:/Users/souls/OneDrive/Documents/terr_mod/modules/ecr"
    mutable = "MUTABLE"
    encryption_type = "AES256"

    
    
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