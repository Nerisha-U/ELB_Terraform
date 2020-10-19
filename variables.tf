/*variable "ami" {
  type = "map"

  default = {
    "us-east-1" = "ami-04169656fea786776"
    "us-west-1" = "ami-006fce2a9625b177f"
  }
}
*/
variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "KeyName" {
  type = string

}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = list(string)
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
	type = list(string)
	default = ["us-east-1a", "us-east-1b"]
}

variable "webservers_ami" {
 default = "ami-0ff8a91507f77f867"
}