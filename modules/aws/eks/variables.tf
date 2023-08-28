variable "prefix" {
  type = string
}

variable "vpc_prefix" {
  type = string
}

variable "eks_cluster_version" {
  type    = string
  nullable = false
  default = "1.26"
}

variable "iam_admin_role" {
  type    = string
  nullable = false
  default = "AWSReservedSSO_AdministratorAccess_.*" #Sometimes "AWSReservedSSO_AWSAdministratorAccess_.*" ?
}

variable "eks_cluster_public" {
  type    = bool
  nullable = false
  default = false
}

variable "eks_main_min_size" {
  type    = number
  nullable = false
  default = 2
}

variable "eks_main_max_size" {
  type    = number
  nullable = false
  default = 3
}

variable "eks_main_instance_types" {
  type    = list(string)
  default = ["t3.large"]
}

variable "eks_spot_min_size" {
  type    = number
  nullable = false
  default = 1
}

variable "eks_spot_max_size" {
  type    = number
  nullable = false
  default = 3
}

variable "eks_spot_instance_types" {
  type = list(string)
  nullable = false
  default = [
    "t3.medium",
    "t3.large"
  ]
}

variable "eks_db_min_size" {
  type    = number
  nullable = false
  default = 1
}

variable "eks_db_max_size" {
  type    = number
  nullable = false
  default = 3
}

variable "eks_db_instance_types" {
  type    = list(string)
  nullable = false
  default = ["t3.large"]
}


variable "eks_mon_min_size" {
  type    = number
  nullable = false
  default = 1
}

variable "eks_mon_max_size" {
  type    = number
  nullable = false
  default = 3
}

variable "eks_mon_instance_types" {
  type    = list(string)
  default = ["t3.large"]
}

variable "eks_mon_single_subnet" {
  type    = bool
  nullable = false
  default = true
}

variable "cluster_enabled_log_types" {
  type    = list(string)
  nullable = false
  default = ["api", "authenticator"]
}

variable "crossplane_enable" {
  type    = bool
  default = true
}

locals {
  hname = "${var.prefix}-${terraform.workspace}"
}