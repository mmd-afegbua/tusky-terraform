data "local_file" "devops_pgp_key" {
    filename = "./public-key-binary.gpg"
}

resource "aws_iam_user" "tusky" {
    for_each = toset(var.user_names)
    name = each.value
}


# DevOps Policy and Permissions
resource "aws_iam_policy" "devops_access" {
    name = var.devops_team_policy
    policy = data.aws_iam_policy_document.devops.json
}


resource "aws_iam_user_policy_attachment" "devops_access" {
    count = var.give_devops_access ? 1 : 0
    user = aws_iam_user.tusky["devops_team"].name
    policy_arn = aws_iam_policy.devops_access.arn
    depends_on = [aws_iam_user.tusky]
}

resource "aws_iam_user_login_profile" "devops_access" {
    count = var.give_devops_access ? 1 : 0
    user = aws_iam_user.tusky["devops_team"].name
    pgp_key = data.local_file.devops_pgp_key.content_base64
    password_length = var.password_length
    password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "devops_access" {
    count = var.give_devops_access ? 1 : 0
    user = aws_iam_user.tusky["devops_team"].name

    pgp_key = data.local_file.devops_pgp_key.content_base64
}
/*
resource "aws_iam_user_ssh_key" "devops_access" {
  count = var.give_devops_access ? 1: 0

  username   = aws_iam_user.tusky["devops_team"].name
  encoding   = var.ssh_key_encoding
  public_key = var.ssh_public_key
}
*/
# Billing Account
resource "aws_iam_policy" "billing_access" {
    name = var.billing_policy
    policy = data.aws_iam_policy_document.billing.json
}


resource "aws_iam_user_policy_attachment" "billing_access" {
    count = var.give_devops_access ? 1 : 0
    user = aws_iam_user.tusky["billing"].name
    policy_arn = aws_iam_policy.devops_access.arn
    depends_on = [aws_iam_user.tusky]
}