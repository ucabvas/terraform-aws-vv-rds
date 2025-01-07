output "rds_master_password_secret_arn" {
  description = "The name of the secret storing the master user password"
  value       = aws_db_instance.retool_postgres.master_user_secret[0].secret_arn
}

output "rds_hostname" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.retool_postgres.address
}