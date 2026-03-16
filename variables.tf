 variable "vpc_availability_zones" {
   type    = list(string)
 #default = ["ap-south-1c", "ap-south-1b"] 
 }

 variable "cidr_block" {
  type = list(string)
  #default = ["10.0.0.0/16","10.0.0.0/24","10.0.1.0/24","0.0.0.0/0"]
   
 }

 variable "mutable" {
  type = string
   
 }

 variable "encryption_type" {
  type = string
   
 }