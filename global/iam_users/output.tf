output "iam_users" {
    value = [for name in var.user_names : upper(name)]
}

#output "access_key_id" {
#    value = aws_iam_access_key.devops_access[0].user_access_key_id
#}

output "secret_access_key" {
    value = aws_iam_access_key.devops_access[0].encrypted_secret
}


output "keybase_password_decrypt_command" {
  value = <<EOF
echo "${element(
  concat(aws_iam_user_login_profile.devops_access.*.encrypted_password, [""]),
  0,
)}" | base64 --decode | gpg --decrypt
EOF
}