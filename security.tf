###############
# Production LB
###############
resource "aws_security_group" "production_instance_east_1" {
  name        = "production-instance-east-1-sg"
  description = "Production Instance security group for us-east-1"
  vpc_id      = aws_vpc.production_vpc.id

  tags = {
    Name        = "production-instance"
    Environment = "Production"
    Purpose     = "Direct to Instance"
  }
}

## Rules

resource "aws_security_group_rule" "production_instance_east_1_https_anywhere" {
  cidr_blocks       = ["0.0.0.0/32"]
  description       = "Accept https from anywhere"
  from_port         = 443
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.production_instance_east_1.id
  self              = false
  to_port           = 443
  type              = "ingress"
}
