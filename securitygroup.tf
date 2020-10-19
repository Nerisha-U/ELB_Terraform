#creating scurity group for EC2
resource "aws_security_group" "elbsg" {
  name = "elbsg"
  vpc_id     = aws_vpc.public.id

  ingress {
    description = "allows ssh traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allow traffice from anywhere
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allows http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allow traffice from anywhere
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  /*lifecycle {
      create_before_destroy = true
  }*/

}
