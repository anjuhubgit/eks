resource "aws_vpc" "cluster" {
    cidr_block = "10.0.0.0/16"
  
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.cluster.id
    cidr_block = "10.0.0.0/24"

  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.cluster.id
    cidr_block = "10.0.1.0/24"
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.cluster.id
  
}
resource "aws_nat_gateway" "mynat" {
    subnet_id = aws_subnet.private.id
  
}
resource "aws_route_table" "table1" {
    vpc_id = aws_vpc.cluster.id
    route {
        cidr_block = "0.0.0.0/0"
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
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.mynat.id
    }
  
}

resource "aws_route_table_association" "private" {
   route_table_id = aws_route_table.table2.id  
   subnet_id = aws_subnet.private.id
}