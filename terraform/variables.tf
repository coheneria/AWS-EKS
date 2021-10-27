variable "region" {
  default     = "eu-west-1"
  description = "AWS deafult region"
}

variable "cluster_name" {
  default = "wave-eks-finalproject-2"
}

variable "aws_create_iam_policy" {
  type = bool
  default = true
  description = "Do you want to create AWS IAM policy?"
}

variable "aws_iam_policy_name" {
  type = string
  default = "KubernetesClusterAutoscaler"
  description = "Name of AWS IAM policy"
}

variable "aws_iam_role_for_policy" {
  type = string
  default = null
  description = "AWS IAM Role name for attaching AWS IAM policy."
}

variable "kubernetes_priority_class_name" {
  description = "Priority class for autoscaler deployment"
  type        = string
  default     = null
}