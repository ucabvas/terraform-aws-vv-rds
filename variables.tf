variable "vv_rds_env_identifier" {
    type        = string
    description = "environment identifier of the rds instance"
    default     = "prod"
}

variable "vv_rds_vpc_id" {
    description = "The VPC ID"
    type        = string
}

variable "vv_rds_subnet_id_0" {
    description = "The first subnet ID where the RDS instance will be deployed"
    type        = string
}

variable "vv_rds_subnet_id_1" {
    description = "The second subnet ID where the RDS instance will be deployed"
    type        = string
}

variable "vv_rds_db_name" {
    description = "The database name"
    type        = string
    default     = "retool"
}

variable "vv_rds_username" {
    description = "The database username"
    type        = string
    default     = "postgres"
}
