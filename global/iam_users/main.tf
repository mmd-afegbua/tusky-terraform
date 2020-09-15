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