variable "vv_rds_db_identifier" {
    type        = string
    description = "name of the rds instance"
    default     = "0"
}

variable "vv_rds_vpc_id" {
    description = "The VPC ID"
    type        = string
}

variable "vv_rds_subnet_id" {
    description = "The VPC subnet ID"
    type        = string
}

variable "vv_rds_db_name" {
    description = "The database name"
    type        = string
    default     = "hammerhead_production"
}

variable "vv_rds_username" {
    description = "The database username"
    type        = string
    default     = "postgres"
}

variable "vv_rds_password" {
    description = "The database password"
    type        = string
}