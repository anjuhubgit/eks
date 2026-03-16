variable "vpc_id" {
    description = "vpc id"
    type = string
  
}

variable "subnet_ids" {
   description = "priv sub"
   type =list(string) 
}

variable "role" {
    description = "role"
    type = string
    
  
}