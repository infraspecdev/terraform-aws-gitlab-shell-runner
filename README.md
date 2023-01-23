# gitlab-shell-runner

This Terraform module provisions an AWS EC2 instance and configures it as a GitLab Runner with Shell executor, allowing it to run CI/CD jobs for your GitLab projects. The module can be used to deploy multiple runners and can be customized to your specific needs.

## Usage

```hcl
module "gitlab_shell_runner" {
  source = "https://github.com/infraspecdev/terraform-aws-gitlab-shell-runner"

  ami_id                    = "ami-0addfae420fd47aab"
  instance_type             = "t2.micro"
  instance_count            = 2
  vpc_security_group_ids    = ["sg-0b0b0b0b0b0b0b0b0"]
  subnet_id                 = "subnet-0b0e1c4b5b1b1b1b1"
  gitlab_url                = "https://gitlab.example.com"
  runner_registration_token = "runner-registration-token-here"
  ssh_public_key            = "ssh-public-key-here"
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to apply to the resources | `map(string)` | `{}` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI to use for the instance | `string` | `"ami-0addfae420fd47aab"` | no |
| <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url) | URL of your Gitlab instance | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances to provision | `number` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of instance to provision | `string` | n/a | yes |
| <a name="input_run_untagged_jobs"></a> [run\_untagged\_jobs](#input\_run\_untagged\_jobs) | Should run untagged jobs or not | `bool` | `true` | no |
| <a name="input_runner_description"></a> [runner\_description](#input\_runner\_description) | Description for Gitlab Runners | `string` | `"Shell Runner"` | no |
| <a name="input_runner_locked"></a> [runner\_locked](#input\_runner\_locked) | Should Lock the runners or not | `bool` | `false` | no |
| <a name="input_runner_registration_token"></a> [runner\_registration\_token](#input\_runner\_registration\_token) | Registration token for Gitlab Runners | `string` | n/a | yes |
| <a name="input_runner_tags"></a> [runner\_tags](#input\_runner\_tags) | Tags for Gitlab Runners for filtering | `list(string)` | <pre>[<br>  "shell",<br>  "aws"<br>]</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Existing SSH public key to use for the key pair | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID to launch in | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to associate | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module maintained by [Infraspec](https://github.com/infraspecdev).
