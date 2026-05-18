# AWS Infrastructure Pipeline 🚀

This repository contains a modular and highly effective Terraform configuration to provision a robust AWS infrastructure pipeline. It deploys a secure, scalable, and highly available architecture on AWS.

## 🏗️ Architecture Overview

The infrastructure is broken down into four distinct, reusable Terraform modules:

1. **Network Module (`modules/network`)**
   - Provisions a Virtual Private Cloud (VPC) with a `10.0.0.0/16` CIDR block.
   - Sets up multiple public subnets across availability zones for high availability.
   - Configures an Internet Gateway and Route Tables for external internet access.

2. **Compute Module (`modules/compute`)**
   - Deploys an Application Load Balancer (ALB) to distribute incoming traffic.
   - Sets up an Auto Scaling Group (ASG) using Launch Templates for dynamic scaling.
   - Configures Security Groups to allow SSH, HTTP, and HTTPS traffic.

3. **Database Module (`modules/database`)**
   - Provisions a DynamoDB table (`app-db`) with `PAY_PER_REQUEST` billing for flexible and cost-effective NoSQL storage.

4. **Storage Module (`modules/storage`)**
   - Creates a secure Amazon S3 bucket.
   - Enforces strict ownership controls and blocks all public access to ensure maximum data security.

## ⚙️ Prerequisites

- **Terraform** v1.0.0 or higher.
- **AWS CLI** configured with appropriate IAM credentials.

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/VishnuSaravanan335/Infrasture_pipeline.git
   cd Infrasture_pipeline
   ```

2. **Initialize Terraform:**
   This will download the necessary provider plugins and initialize the backend.
   ```bash
   terraform init
   ```

3. **Review the deployment plan:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## 🔐 Security & Best Practices
- **Modularization**: Code is strictly separated by resource type, ensuring high reusability and isolated blast radiuses.
- **State Management**: Terraform state is configured to be securely backed by an S3 backend (`demo-app-deploy-335-vishnu-2026`) with state locking.
- **Parameterization**: Hardcoded sensitive credentials and personal identifiers have been abstracted into variables for secure configuration.

## 📤 Outputs
- `alb_dns_name`: The DNS name of the Application Load Balancer to access the application.
- `dynamodb_table_name`: The name of the provisioned DynamoDB table.
- `s3_bucket_name`: The name of the provisioned S3 bucket.

## 🎉 Deployment Results

### Terraform Outputs
After a successful deployment, the infrastructure outputs the following values:

```text
[ec2-user@ip-172-31-110-9 ~]$ terraform output
alb_dns_name = "app-lb-1701439727.us-east-1.elb.amazonaws.com"
dynamodb_table_name = "app-db"
s3_bucket_name = "demo-app-storage-vishnu-2026"
```

### Terraform State
The infrastructure configuration provisions all the required resources securely:

```text
[ec2-user@ip-172-31-110-9 ~]$ terraform state list
aws_autoscaling_group.app_asg
aws_dynamodb_table.app_db
aws_instance.app_vm
aws_internet_gateway.igw
aws_launch_template.app_lt
aws_lb.app_lb
aws_lb_listener.app_listener
aws_lb_target_group.app_tg
aws_route_table.public_rt
aws_route_table_association.public_assoc_a
aws_route_table_association.public_assoc_b
aws_s3_bucket.app_bucket
aws_s3_bucket_ownership_controls.app_bucket_owner
aws_s3_bucket_public_access_block.app_bucket_block
aws_security_group.app_sg
aws_subnet.public_subnet_a
aws_subnet.public_subnet_b
aws_vpc.main_vpc
```
