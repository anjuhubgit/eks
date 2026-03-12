output "vpc_id" {
  description = "id of vpc"
  value = aws_vpc.cluster.id
}

output "aws_subnet_public" {
    description = "subnet"
    value = aws_subnet.public.id
  
}

output "aws_subnet_private" {
  description = "validue"  
  value = aws_subnet.private.id
}