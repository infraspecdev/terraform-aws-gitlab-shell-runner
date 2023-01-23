variable "ami_id" {
  description = "AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to provision"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to provision"
  type        = number
  default     = 1
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "gitlab_url" {
  description = "Gitlab URL"
  type        = string
}

variable "runner_registration_token" {
  description = "Gitlab registration token"
  type        = string
}

variable "runner_description" {
  description = "Description for Gitlab Runners"
  type        = string
  default     = "Shell Runner"
}

variable "runner_tags" {
  description = "Runner tags"
  type        = list(string)
  default     = ["shell", "aws"]
}

variable "run_untagged_jobs" {
  description = "Run untagged jobs or not"
  type        = bool
  default     = true
}

variable "runner_locked" {
  description = "Lock the runner or not"
  type        = bool
  default     = false
}

variable "ssh_public_key" {
  description = "SSH public key to use for the key pair"
  type        = string
  default     = null
}
