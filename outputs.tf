output "vpc_id" {
  value = aws_vpc.main-vpc.id
}
output "nginx_public_ip" {
  value = aws_instance.nginx_server.public_ip
}