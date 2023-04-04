locals {
  key_arn_names = {
    "arn:aws:secretsmanager:region:aws_account_id:secret" = [ "SALESFORCE_HOST", "SALESFORCE_USERNAME", "SALESFORCE_PASSWORD", "SALESFORCE_SECURITY_TOKEN",
      "SALESFORCE_CLIENT_ID", "SALESFORCE_CLIENT_SECRET", "BASE_URL", "AWS_REGION"]
  }
  ecs_secrets = [
    for key_arn, key_names in local.key_arn_names : [
      for key_name in key_names:{
        name      = key_name
        valueFrom = "${key_arn}:${key_name}::"
      }
    ]
  ]
  ecs_secret_key = keys(local.key_arn_names)
}

output "secrets" {
        value = local.ecs_secrets
}

output "ecs_secret_key" {
  value = local.ecs_secret_key
}
