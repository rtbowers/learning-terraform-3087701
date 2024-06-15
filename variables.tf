variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
  description = "Name filter and owner for AMI"
  type = object({
    name = string
    owner = string
  })
  default = {
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
    owners = ["979382823631"] # Bitnami
  }
}

variable "environment" {
  description = "Development Environment"
  type = object({
    name           = string
    network_prefix = string
  })
  
  default = {
    name           = "dev"
    network_prefix = "10.0"
  }

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "asg_min_size" {
    description = "Minimum number of instance in the ASG"
    default     = 1
}
 
variable "asg_max_size" {
    description = "Minimum number of instance in the ASG"
    default     = 2
}
