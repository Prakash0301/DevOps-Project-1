variable "sg_id" {
  description = "Security group ID for the ALB"
  type        = string
  
}

variable "subnet_id" {
  description = "Subnet ID for the ALB"
  type        = list(string)
  
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
  
}

variable "instances" {
    description = "instances id for target group attachment"
    type        = list(string)
  
}