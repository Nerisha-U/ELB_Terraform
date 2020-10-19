resource "aws_subnet" "public" {
    count      = length(var.subnets_cidr)
    vpc_id     = aws_vpc.public.id
    cidr_block = element(var.subnets_cidr,count.index)
    availability_zone = element(var.azs,count.index)
    map_public_ip_on_launch = true //to assign public IP to instances launched

  tags = {
    Name = "public-${count.index+1}"
  }
}