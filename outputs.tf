output "rds_master_password_secret_path" {
  description = "The path of the secret storing the master user password"
  value       = element(split(":", aws_db_instance.retool_postgres.master_user_secret[0].secret_arn), length(split(":", aws_db_instance.retool_postgres.master_user_secret[0].secret_arn)) - 1)
}

output "rds_hostname" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.retool_postgres.address
}
