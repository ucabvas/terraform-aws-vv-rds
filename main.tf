resource "aws_route53_zone" "retool_postgres_private_zone" {
  name = "retool-${var.vv_rds_env_identifier}.internal"
  
  vpc {
    vpc_id = var.vv_rds_vpc_id
  }
}

resource "aws_security_group" "retool_postgres_sg" {
  name        = "${local.identifier}-sg"
  description = "Allow traffic only from within the subnet"
  vpc_id      = var.vv_rds_vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = local.subnet_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.identifier}-sg"
  }
}

resource "aws_db_subnet_group" "retool_postgres_subnet_group" {
  name       = "${local.identifier}-subnet-group"
  subnet_ids = local.subnet_ids

  tags = {
    Name = "${local.identifier}-subnet-group"
  }
}

resource "aws_db_parameter_group" "postgres_parameter_group" {
  family = "postgres16"
  name   = "${local.identifier}-param-group"
}

# Create the RDS instance
resource "aws_db_instance" "retool_postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16.4"
  instance_class       = "db.t3.micro"
  db_name              = "${var.vv_rds_db_name}"
  username             = "${var.vv_rds_username}"
  password             = "${var.vv_rds_password}"
  parameter_group_name = aws_db_parameter_group.postgres_parameter_group.name
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.retool_postgres_subnet_group.name
  vpc_security_group_ids = [aws_security_group.retool_postgres_sg.id]
}

# Create a CNAME in the private zone for predictable hostname
resource "aws_route53_record" "retool_postgres_cname" {
  zone_id = aws_route53_zone.retool_postgres_private_zone.zone_id
  name    = "${local.identifier}.${aws_route53_zone.retool_postgres_private_zone.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_db_instance.retool_postgres.address]
}