provider "aws" {
  region = "us-east-1"
}

# creating an instance webapp with its key pair
resource "aws_instance" "myInstance" {
  count                  = length(var.subnets_cidr)
  ami                    = data.aws_ami.linux.id
  instance_type          = var.instance_type
  key_name               = var.KeyName
  
  vpc_security_group_ids = [aws_security_group.elbsg.id]
  subnet_id              = element(aws_subnet.public.*.id,count.index)
  user_data              = file("userdata.sh")

  tags = {
    Name        = "ELB-${count.index+1}"
    environment = "dev"
    timetolive  = "10"
    backup      = "yes"

  }
}