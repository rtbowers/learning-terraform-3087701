output "instance_ami" {
  value = aws_instance.blog.ami
}

output "instance_arn" {
  value = aws_instance.blog.arn
}

output "environment_url" {
  value = module.dev.lb_dns_name
}
