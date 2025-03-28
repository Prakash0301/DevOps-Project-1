#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "My_VPC"
  }
}
# Subnet-2

resource "aws_subnet" "subnet" {
    count = length(var.subnet_cidr)
    vpc_id     = aws_vpc.my_vpc.id
    availability_zone = data.aws_availability_zones.available.names[count.index]
    cidr_block = var.subnet_cidr[count.index]
    map_public_ip_on_launch = true
    
    tags = {
        Name = var.subnet_names[count.index]
    }   
  
}

# Internet Gateway 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "MyInternetGateway"
  }
}

# Route Table

resource "aws_route_table" "Public-RT" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0" # all traffic public
        gateway_id = aws_internet_gateway.igw.id
    }
  
}

# Route Table Association

resource "aws_route_table_association" "RTA" {  
    count = length(var.subnet_cidr)
    subnet_id      = aws_subnet.subnet[count.index].id
    route_table_id = aws_route_table.Public-RT.id
  
}