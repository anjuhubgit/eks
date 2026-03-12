resource "aws_ecr_repository" "image_repo" {
    name = "myimage_repo"
    image_tag_mutability = var.mutable
    encryption_configuration {
      encryption_type = var.encryption_type
    }
    image_scanning_configuration {
      scan_on_push = true
    }

  
}