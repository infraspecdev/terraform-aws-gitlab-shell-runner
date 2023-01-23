locals {
  tags = {
    Name      = "gitlab-shell-runner"
    ManagedBy = "Terraform"
  }
  runner_user_data = templatefile("${path.module}/templates/runner.tftpl", {
    gitlab_url                = var.gitlab_url
    runner_registration_token = var.runner_registration_token
    runner_description        = var.runner_description
    runner_tags               = "\"${join(", ", var.runner_tags)}\""
    run_untagged_jobs         = var.run_untagged_jobs
    runner_locked             = var.runner_locked
  })
}

resource "aws_key_pair" "this" {
  count = var.ssh_public_key != null ? 1 : 0

  key_name   = "gitlab-shell-runner"
  public_key = var.ssh_public_key

  tags = merge(
    local.tags,
    var.additional_tags,
  )
}

resource "aws_instance" "this" {
  count = var.instance_count

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_public_key != null ? aws_key_pair.this[0].key_name : null
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  user_data                   = local.runner_user_data
  user_data_replace_on_change = true

  tags = merge(
    local.tags,
    var.additional_tags,
  )
}
