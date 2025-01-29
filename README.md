# Terraform AWS Infrastructure Deployment

This repository contains Terraform configurations to deploy a comprehensive AWS infrastructure. The setup includes a Virtual Private Cloud (VPC), public and private subnets, an Application Load Balancer (ALB), Auto Scaling Groups (ASG), Relational Database Service (RDS), NAT Gateways, Simple Notification Service (SNS), and various security groups to secure the environment.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Infrastructure Overview](#infrastructure-overview)
3. [Configuration Files](#configuration-files)
4. [Deployment Steps](#deployment-steps)
5. [Outputs](#outputs)
6. [Security Considerations](#security-considerations)
7. [Cleanup](#cleanup)

## Prerequisites

Before deploying the infrastructure, ensure you have the following:

- **Terraform**: Install Terraform from [here](https://www.terraform.io/downloads.html).
- **AWS CLI**: Install and configure the AWS CLI with the necessary credentials. Follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
- **AWS Account**: Ensure you have an AWS account with sufficient permissions to create the resources defined in the Terraform configurations.
- **SSH Key Pair**: Create an SSH key pair in the AWS region where you plan to deploy the infrastructure. This key pair will be used for EC2 instances.
- **Valid Email Address**: For SNS topic subscription, ensure you have a valid email address to receive notifications.

## Infrastructure Overview

The infrastructure is designed to be highly available and secure. Below is a high-level overview of the components:

- **VPC**: A Virtual Private Cloud with public and private subnets across two availability zones (AZs).
- **Public Subnets**: Hosts the Application Load Balancer (ALB) and NAT Gateways.
- **Private Subnets**: Hosts EC2 instances (web servers) and the RDS database.
- **Application Load Balancer (ALB)**: Distributes incoming traffic across EC2 instances in the private subnets.
- **Auto Scaling Group (ASG)**: Automatically adjusts the number of EC2 instances based on demand.
- **RDS Database**: A MySQL/Aurora database instance deployed in private subnets for high availability.
- **NAT Gateways**: Allows instances in private subnets to access the internet for updates and patches while remaining secure.
- **Security Groups**: Restrict access to resources based on IP addresses and protocols.
- **SNS Topic**: Provides notifications for Auto Scaling Group events such as instance launches and terminations.

## Configuration Files

The repository contains the following Terraform configuration files:

- **`.gitignore`**: Specifies files and directories to be ignored by version control.
- **`.terraform.lock.hcl`**: Lock file for Terraform provider versions.
- **`alb.tf`**: Defines the Application Load Balancer, target group, and listeners.
- **`asg.tf`**: Configures the Auto Scaling Group, launch template, and notifications.
- **`main.tf`**: Configures the AWS provider and Terraform backend for state management.
- **`nategateway.tf`**: Sets up NAT Gateways and route tables for private subnets.
- **`output.tf`**: Defines the outputs for the Terraform configuration.
- **`rds.tf`**: Configures the RDS database instance and subnet group.
- **`security-group.tf`**: Defines security groups for the ALB, EC2 instances, and RDS database.
- **`sns.tf`**: Configures the SNS topic and subscription for notifications.
- **`variable.tf`**: Defines variables used across the Terraform configurations.
- **`vpc.tf`**: Configures the VPC, subnets, internet gateway, and route tables.

## Deployment Steps

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform**:
   This command initializes the working directory and downloads the necessary providers.
   ```bash
   terraform init
   ```

3. **Review the Plan**:
   Generate and review the execution plan to ensure the configuration will create the desired infrastructure.
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   Apply the Terraform configuration to create the infrastructure.
   ```bash
   terraform apply
   ```
   Confirm the action by typing `yes` when prompted.

5. **Verify Deployment**:
   Once the deployment is complete, Terraform will output the VPC ID, public subnet IDs, and the website URL. Use these outputs to verify the deployment.

6. **Subscribe to SNS Notifications**:
   After the deployment, check your email for a subscription confirmation from AWS SNS. Confirm the subscription to start receiving notifications.

## Outputs

After a successful deployment, Terraform will output the following:

- **`vpc_id`**: The ID of the created VPC.
- **`public_subnet_az1_id`**: The ID of the public subnet in Availability Zone 1.
- **`website_url`**: The URL of the deployed website.

Example output:
```bash
vpc_id = "vpc-0123456789abcdef0"
public_subnet_az1_id = "subnet-0123456789abcdef0"
website_url = "https://www.cloudrookie.online"
```

## Security Considerations

- **SSH Access**: SSH access to the EC2 instances is restricted to the IP address specified in the `ssh_location` variable.
- **Database Security**: The RDS database is deployed in private subnets and is only accessible from the web server security group.
- **ALB Security**: The Application Load Balancer only allows HTTP/HTTPS traffic on ports 80 and 443.
- **NAT Gateways**: NAT Gateways are used to allow outbound internet access for instances in private subnets while preventing inbound access.
- **SNS Notifications**: Ensure that the email address used for SNS subscriptions is valid and monitored for important notifications.

## Cleanup

To avoid incurring unnecessary charges, destroy the infrastructure once it is no longer needed.

1. **Destroy the Infrastructure**:
   ```bash
   terraform destroy
   ```
   Confirm the action by typing `yes` when prompted.

2. **Verify Deletion**:
   Ensure that all resources have been deleted by checking the AWS Management Console.

---

This README provides a comprehensive guide to deploying and managing the AWS infrastructure using Terraform.
