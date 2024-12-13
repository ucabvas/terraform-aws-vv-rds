resource "aws_db_instance" "postgres" {
  identifier           = var.identifier
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  storage_encrypted    = var.storage_encrypted
  kms_key_id           = var.kms_key_id

  db_name                 = var.db_name
  username             = var.username
  password             = var.password
  port                 = var.port

  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible    = var.publicly_accessible

  parameter_group_name = var.parameter_group_name
  backup_retention_period = var.backup_retention_period
  backup_window        = var.backup_window
  maintenance_window   = var.maintenance_window

  multi_az             = var.multi_az
  skip_final_snapshot  = var.skip_final_snapshot

  tags = var.tags
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "13.7"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)"
  type        = string
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key"
  type        = string
  default     = null
}

variable "db_name" {
  description = "The DB name to create"
  type        = string
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 5432
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
}

variable "subnet_id" {
  description = "The VPC subnet ID"
  type        = string
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 1
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-06:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

output "endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.postgres.arn
}
