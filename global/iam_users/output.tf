output "iam_users" {
    value = [for name in var.user_names : upper(name)]
}