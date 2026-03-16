variable "availability_zone" {
    description = "zone"
    type = list(string)
    #default = [ "ap-south-1b","ap-south-1c" ]
   
}

variable "cidr_block" {
    description = "block"
    type = list(string)
  
}