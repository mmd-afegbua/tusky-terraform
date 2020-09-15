variable "region" {
    description = "default region"
    type = string
    default = "us-east-1"
}

variable "project" {
    description = "Name of project"
    type = string
    default = "mmd"
}

variable "user_names" {
    description = "Names for IAM users"
    type = list(string)
    default = ["devops_team", "kubernetes_admin", "billing"]
}

#########################################
variable "devops_team_policy" {
    description = "Policy for devops user"
    type = string
    default = "devops"
}

variable "billing_policy" {
    description = "Policy for billing viewer"
    type = string
    default = "billig"
}

########################################
variable "give_devops_access" {
    description = "If true, devops_team gets its permission"
    type = bool
}

variable "give_billing_access" {
    description = "If true, billing gets access"
    type = bool
}