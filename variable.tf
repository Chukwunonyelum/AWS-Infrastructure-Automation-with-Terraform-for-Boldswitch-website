#vpc variables
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
    description = "vpc cidr block"
    type        = string 
}

variable "public_subnet_az1_cidr" {
    default     = "10.0.0.0/24"
    description = "public_subnet_az1 cidr block"
    type        = string 
}

variable "public_subnet_az2_cidr" {
    default     = "10.0.1.0/24"
    description = "public_subnet_az2 cidr block"
    type        = string 
}


variable "private_app_subnet_az1_cidr" {
    default     = "10.0.2.0/24"
    description = "private_app_subnet_az1_cidr_block"
    type        = string 
}



variable "private_app_subnet_az2_cidr" {
    default     = "10.0.3.0/24"
    description = "private_app_subnet_az2_cidr_block"
    type        = string 
}



variable "private_data_subnet_az1_cidr" {
    default     = "10.0.4.0/24"
    description = "private_data_subnet_az1_cidr_block"
    type        = string 
}


variable "private_data_subnet_az2_cidr" {
    default     = "10.0.5.0/24"
    description = "private_data_subnet_az2_cidr_block"
    type        = string 
}


#security group variable
variable "ssh_location" {
    default     = "0.0.0.0/0"
    description = "the ip address that can ssh into ec2 instance"
    type        = string 
}


#rds variables
variable "database_snapshot_identifier" {
    default     = "arn:aws:rds:us-east-1:054037104385:snapshot:ikenga-snapshot"
    description = "database snapshot identifier arn"
    type        = string 
}


variable "database_instance_class" {
    default     = "db.t3.micro"
    description = "the database instance type"
    type        = string 
}

variable "database_instance_identifier" {
    default     = "ikenga"
    description = "the database instance identifier"
    type        = string 
}


variable "multi_az_deployment" {
    default     = false
    description = "create a standby db instance"
    type        = bool 
}


#application load balancer arn 
variable "ssl_certificate_arn" {
    default     = "arn:aws:acm:us-east-1:054037104385:certificate/17ae3204-ce66-482f-8511-467900cd43b2"
    description = "ssl certificate arn"
    type        = string 
}


#sns topic variable
variable "operator_email" {
    default     = "chinonyevic007@gmail.com"
    description = "valid email address"
    type        = string 
}


#autoscaling variables
variable "launch_template_name" {
    default     = "dev-launch-template"
    description = "name of the launch template"
    type        = string 
}


variable "ec2_image_id" {
    default     = "ami-09d1a8fa3684f9835"
    description = "id of the ami"
    type        = string 
}


variable "instance_id_type" {
    default     = "t2.micro"
    description = "the instance id type"
    type        = string 
}


variable "ec2_keypair_name" {
    default     = "my-key"
    description = "name of the ec2 keypair"
    type        = string 
}