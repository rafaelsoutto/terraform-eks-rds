output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "db_instance_sg" {
  value = [aws_security_group.db_instance_sg.id]
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnet.*.id
}
