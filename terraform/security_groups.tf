resource "aws_security_group" "vpn-inbound" {
  name        = "tf-vpn-inbound"
  description = "vpn-inbound"

  ingress {
    description = "udp"
    from_port   = 1
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "udp"
    from_port   = 1
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "tcp"
    from_port   = 1
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "tcp"
    from_port   = 853
    to_port     = 853
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  tags = {
    Name = "vpc-inbound"
  }
}

resource "aws_security_group" "ssh" {
  name        = "tf-ssh"
  description = "ssh"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "vpn-outbound" {
  name        = "tf-outbound-all"
  description = "outbound-all"

  egress {
    description = "outgoing udp"
    from_port   = 1
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "outgoing tcp"
    from_port   = 1
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "outgoing icmp"
    from_port   = "8"
    to_port     = "0"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-outbound"
  }
}

output "sg-vpn-inbound" { value = aws_security_group.vpn-inbound.id }
output "sg-ssh" { value = aws_security_group.ssh.id }
output "sg-vpn-outbound" { value = aws_security_group.vpn-outbound.id }