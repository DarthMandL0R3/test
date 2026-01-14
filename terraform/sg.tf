module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  for_each = local.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.main.id
  ingress_rules       = each.value.ingress_rules
  ingress_cidr_blocks = each.value.ingress_cidr_blocks
  egress_rules        = ["all-all"]
}