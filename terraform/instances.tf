
resource "aws_instance" "web_server" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [module.security_group["pub_sg"].security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  key_name      = aws_key_pair.ansible.key_name

  tags = {
    Name = "web-server"
  }
}

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id
}

resource "aws_instance" "ansible_controller" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id
  private_ip    = "10.0.0.6"
  vpc_security_group_ids = [module.security_group["priv_sg"].security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  key_name      = aws_key_pair.ansible.key_name

  tags = {
    Name = "ansible-controller"
  }
}

resource "aws_instance" "monitoring_server" {
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id
  private_ip    = "10.0.0.7"
  vpc_security_group_ids = [module.security_group["priv_sg"].security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  key_name      = aws_key_pair.ansible.key_name

  tags = {
    Name = "monitoring-server"
  }
}