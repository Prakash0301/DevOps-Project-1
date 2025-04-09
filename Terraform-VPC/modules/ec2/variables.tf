variable "sg_id" {
description = "Sg ids"
type = string
}

variable "subnet_id" {
description = "Subnet id for ec2"   
type = list(string)
}

variable "ec2_names" {
    description = "value of ec2 names"
    type = list(string)
    default = [ "WebServer", "WebServer2"]
  
}