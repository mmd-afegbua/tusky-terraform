variable "region" {
  description = "default region"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Name of project"
  type        = string
  default     = "mmd"
}

variable "user_names" {
  description = "Names for IAM users"
  type        = list(string)
  default     = ["devops_team", "kubernetes_admin", "billing"]
}

#########################################
variable "devops_team_policy" {
  description = "Policy for devops user"
  type        = string
  default     = "devops"
}

variable "billing_policy" {
  description = "Policy for billing viewer"
  type        = string
  default     = "billig"
}

########################################
variable "give_devops_access" {
  description = "If true, devops_team gets its permission"
  type        = bool
}

variable "give_billing_access" {
  description = "If true, billing gets access"
  type        = bool
}

#########################################
variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. `pgp_key` is required when `create_iam_user_login_profile` is set to `true`"
  type        = string
  default     = ""
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = false
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "ssh_key_encoding" {
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM"
  type        = string
  default     = "SSH"
}

variable "ssh_public_key" {
  description = "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format"
  type        = string
  default     = ""
}