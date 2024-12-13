locals {
  parameter_group_name   = "${local.identifier}-param-group"
  subnet_ids             = [var.vv_rds_subnet_id]
  identifier             = "rds-retool-${var.vv_rds_db_identifier}"
  subnet_cidr_blocks     = [data.aws_subnet.selected.cidr_block]
}

data "aws_subnet" "selected" {
  id = var.vv_rds_subnet_id
}
