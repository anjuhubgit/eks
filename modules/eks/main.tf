resource "aws_eks_cluster" "node-clust" {
    name = "node-cluster"
    role_arn = var.role
    vpc_config {
      #vpc_id = var.vpc_id
      subnet_ids = var.subnet_ids
    }
    #name = "node_cluster"
    

  
}