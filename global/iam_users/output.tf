output "iam_users" {
  value = [for name in var.user_names : upper(name)]
}

###########################################################
#################   DEVOPS OUTPUTS   ######################

output "devops_access_key_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_user.tusky["devops_team"].unique_id
}


output "devops_secret_key_decrypt_command" {
  description = "copy and paste to decrypt the secret key"
  value = <<EOF
echo "${element(
  concat(aws_iam_access_key.devops_access.*.encrypted_secret, [""]),
  0,
)}" | base64 --decode | gpg --decrypt
EOF
}


output "devops_password_decrypt_command" {
  description = "copy and paste to decrypt password"
  value = <<EOF
echo "${element(
  concat(aws_iam_user_login_profile.devops_access.*.encrypted_password, [""]),
  0,
)}" | base64 --decode | gpg --decrypt
EOF
}

###########################################################
#################   DEVOPS OUTPUTS   ######################