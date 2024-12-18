locals {
  subnet_ids             = [var.vv_rds_subnet_id_0, var.vv_rds_subnet_id_1]
  identifier             = "rds-retool-${var.vv_rds_env_identifier}"
  subnet_cidr_blocks     = [data.aws_subnet.subnet_0.cidr_block, data.aws_subnet.subnet_1.cidr_block]
}

data "aws_subnet" "subnet_0" {
  id = var.vv_rds_subnet_id_0
}

data "aws_subnet" "subnet_1" {
  id = var.vv_rds_subnet_id_1
}