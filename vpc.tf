#creating VPC
resource "aws_vpc" "public" {
  cidr_block = var.vpc_cidr
}

#creating Internet Gateway
resource "aws_internet_gateway" "igwTF" {
    vpc_id = aws_vpc.public.id
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.public.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwTF.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "art" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}
