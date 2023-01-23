variable "ami_id" {
  description = "AMI to use for the instance"
  type        = string
  default     = "ami-0addfae420fd47aab"
}

variable "instance_type" {
  description = "Type of instance to provision"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to provision"
  type        = number
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "gitlab_url" {
  description = "URL of your Gitlab instance"
  type        = string
}

variable "runner_registration_token" {
  description = "Registration token for Gitlab Runners"
  type        = string
}

variable "runner_description" {
  description = "Description for Gitlab Runners"
  type        = string
  default     = "Shell Runner"
}

variable "runner_tags" {
  description = "Tags for Gitlab Runners for filtering"
  type        = list(string)
  default     = ["shell", "aws"]
}

variable "run_untagged_jobs" {
  description = "Should run untagged jobs or not"
  type        = bool
  default     = true
}

variable "runner_locked" {
  description = "Should Lock the runners or not"
  type        = bool
  default     = false
}

variable "ssh_public_key" {
  description = "Existing SSH public key to use for the key pair"
  type        = string
  default     = null
}
