resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow http and https, ssh inbound traffic"
  vpc_id      = var.vpc_id

ingress {
    description = "Http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    description = "Https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Name = "My_Sg"
  }
}

