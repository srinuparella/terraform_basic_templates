output "ipid" {
  value = aws_instance.myinstance.public_ip
}
output "http" {
  value = "https://${aws_instance.myinstance.public_ip}:80"
}