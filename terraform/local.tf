locals {
  security_groups = {
    pub_sg = {
      name        = "devops-public-sg"
      description = "Allow HTTP and SSH"
      ingress_rules = ["http-80-tcp"]
      ingress_cidr_blocks = ["0.0.0.0/0"]
      ingress_with_cidr_blocks = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          description = "SSH access"
          cidr_blocks = "10.0.0.0/24"
        }
      ]
    },
    priv_sg = {
      name        = "devops-private-sg"
      description = "Allow SSH"
      ingress_rules = ["ssh-tcp"]
      ingress_cidr_blocks = ["10.0.0.0/24"]
    }
  }
}