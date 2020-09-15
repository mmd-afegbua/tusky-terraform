data "aws_iam_policy_document" "billing" {
    statement {
        effect = "Allow"
        actions = [
            "aws-portal:ViewBilling"
        ]
        resources = ["*"]
    }
}

data "aws_iam_policy_document" "devops" {
        statement {
        effect = "Allow"
        actions = [
            "ec2:*"
        ]
        resources = ["*"]
    }
}

data "aws_iam_policy_document" "kube_admin" {
        statement {
        effect = "Allow"
        actions = [
            "ec2:*"
        ]
        resources = ["*"]
    }
}