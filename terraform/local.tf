locals {
  security_groups = {
    pub_sg = {
      name        = "devops-public-sg"
      description = "Allow HTTP, and SSH"
      ingress_with_cidr_blocks = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          description = "HTTP"
          cidr_blocks = "0.0.0.0/0"
        },
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          description = "SSH access"
          cidr_blocks = "0.0.0.0/0"
        },
        {
          from_port   = -1
          to_port     = -1
          protocol    = "icmp"
          description = "ICMP access"
          cidr_blocks = "10.0.0.0/24"
        }
      ]
    },
    priv_sg = {
      name        = "devops-private-sg"
      description = "Allow SSH and ICMP traffic from VPC"
      ingress_with_cidr_blocks = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          description = "SSH access"
          cidr_blocks = "0.0.0.0/0"
        },
        {
          from_port   = -1
          to_port     = -1
          protocol    = "icmp"
          description = "ICMP access"
          cidr_blocks = "10.0.0.0/24"
        }
      ]
    }
  }
}