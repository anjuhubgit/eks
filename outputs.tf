# output "debug_azs" {
#   value = var.vpc_availability_zones
# }

output "role" {
  value = module.iam.role
}