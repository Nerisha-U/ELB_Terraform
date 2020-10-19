output "elb-dns-name" {
  value = "${aws_elb.elbTF.dns_name}"
}