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
