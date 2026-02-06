output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.web_server.public_ip}"
}
