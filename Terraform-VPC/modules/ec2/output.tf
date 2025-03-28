output "instance" {
  value = aws_instance.Myinstance.*.id
}