resource "aws_vpc" "cluster" {
    cidr_block = var.cidr_block[0]
    tags = {
      name = "cluster-vpc"
    }
    }
  

resource "aws_subnet" "public" {
    #count = length(var.azs)
    vpc_id = aws_vpc.cluster.id
    cidr_block = var.cidr_block[1]
    #availability_zone = var.azs[count.index]
    availability_zone = var.availability_zone[0]

  
}

resource "aws_subnet" "private" {
    #count = length(var.azs)
    vpc_id = aws_vpc.cluster.id
    cidr_block = var.cidr_block[2]
    #availability_zone = var.azs[count.index]
    availability_zone = var.availability_zone[1]
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.cluster.id
  
}
resource "aws_nat_gateway" "mynat" {
    subnet_id = aws_subnet.private.id
    connectivity_type = "private"
  
}
resource "aws_route_table" "table1" {
    vpc_id = aws_vpc.cluster.id
    route {
        cidr_block = var.cidr_block[3]
        gateway_id = aws_internet_gateway.igw.id
        
    }
  
}

resource "aws_route_table_association" "public" {
    route_table_id = aws_route_table.table1.id
    subnet_id = aws_subnet.public.id

  
}

resource "aws_route_table" "table2" {
    vpc_id = aws_vpc.cluster.id
    route {
        cidr_block = var.cidr_block[3]
        nat_gateway_id = aws_nat_gateway.mynat.id
    }
  
}

resource "aws_route_table_association" "private" {
   route_table_id = aws_route_table.table2.id  
   subnet_id = aws_subnet.private.id
}