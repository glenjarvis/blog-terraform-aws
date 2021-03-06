##########
# Groups
##########

resource "aws_iam_group" "admins" {
  name = "Admins"
  path = "/admins/"
}

resource "aws_iam_group" "engineering" {
  name = "Engineering"
  path = "/"
}

resource "aws_iam_group" "power_users" {
  name = "PowerUsers"
  path = "/"
}

resource "aws_iam_group" "read_only" {
  name = "ReadOnly"
  path = "/"
}

###############################
# Policies attached to Groups
###############################


#
# Admin Group
#

resource "aws_iam_group_policy_attachment" "admin-group-aws-admin-attach" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "admin-group-aws-sysadmin-attach" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}

resource "aws_iam_group_policy_attachment" "admin-group-aws-billing-attach" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}


#
# Engineering Group
#

resource "aws_iam_group_policy_attachment" "engineering-group-aws-admin-attach" {
  group      = aws_iam_group.engineering.name
  policy_arn = aws_iam_policy.s3_engineering.arn
}

#########
# Users
#########

resource "aws_iam_user" "glen_jarvis" {
  name = "glen.jarvis"
  path = "/users/"

  tags = {
    "Type" = "User"
    "Title" = "Senior Systems Engineer"
  }
}

resource "aws_iam_user" "jane_doe" {
  name = "jane.doe"
  path = "/users/"

  tags = {
    "Title" = "Senior Systems Engineer"
  }
}

#
# Service Accounts
#

resource "aws_iam_user" "svc_terraform" {
  name = "svc_terraform"
  path = "/users/"

  tags = {
    "Type" = "Service Account"
  }
}

#############################
# User Membership to Groups
#############################

resource "aws_iam_group_membership" "group_members_admin" {
  name = "group-members-admin"

  users = [
    aws_iam_user.glen_jarvis.name,
    aws_iam_user.svc_terraform.name,
  ]

  group = aws_iam_group.admins.name
}

resource "aws_iam_group_membership" "group_members_engineering" {
  name = "group-members-engineering"

  users = [
    aws_iam_user.jane_doe.name,
  ]

  group = aws_iam_group.engineering.name
}

