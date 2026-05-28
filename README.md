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
   - Configures restricted Security Groups to ensure secure traffic flow between the ALB and instances.

3. **Database Module (`modules/database`)**
   - Provisions a DynamoDB table (`app-db`) with `PAY_PER_REQUEST` billing for flexible and cost-effective NoSQL storage.

4. **Storage Module (`modules/storage`)**
   - Creates a secure Amazon S3 bucket.
   - Enforces strict ownership controls and blocks all public access to ensure maximum data security.

### 📊 Architecture Flowchart

```mermaid
graph TD
    subgraph AWS Cloud
        Internet((Internet)) --> IGW[Internet Gateway]
        IGW --> ALB[Application Load Balancer]
        
        subgraph VPC [Virtual Private Cloud 10.0.0.0/16]
            ALB -->|HTTP 80| ASG[Auto Scaling Group]
            
            subgraph Public Subnets
                ASG --> EC2_1[EC2 Instance AZ1]
                ASG --> EC2_2[EC2 Instance AZ2]
            ]
        end
        
        EC2_1 --> DDB[(DynamoDB app-db)]
        EC2_2 --> DDB
        
        EC2_1 --> S3[(Amazon S3 Bucket)]
        EC2_2 --> S3
    end
    
    style Internet fill:#f9f9f9,stroke:#333,stroke-width:2px
    style VPC fill:#e8f4f8,stroke:#0052cc,stroke-width:2px
    style Public Subnets fill:#f0f8ff,stroke:#4169e1,stroke-width:1px,stroke-dasharray: 5 5
```

## ⚙️ Prerequisites

- **Terraform** v1.0.0 or higher.
- **AWS CLI** configured with appropriate IAM credentials.

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/VishnuSaravanan335/Infrastructure_Pipeline.git
   cd Infrastructure_Pipeline
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
- **Parameterization**: Hardcoded sensitive credentials, availability zones, and instance types have been abstracted into variables for secure and flexible configuration.
- **Least Privilege**: Security groups strictly control traffic between the Application Load Balancer and compute instances.

## 📤 Outputs
- `alb_dns_name`: The DNS name of the Application Load Balancer to access the application.
- `dynamodb_table_name`: The name of the provisioned DynamoDB table.
- `s3_bucket_name`: The name of the provisioned S3 bucket.

## 🎉 Deployment Results

### Terraform State Verification
The infrastructure configuration successfully provisions the following resources:

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

### Application & Resource Verification

You can verify the deployment by running the following test commands:

```text
[ec2-user@ip-172-31-110-9 ~]$ curl http://$(terraform output -raw alb_dns_name)

[ec2-user@ip-172-31-110-9 ~]$ aws s3 ls s3://$(terraform output -raw s3_bucket_name)

[ec2-user@ip-172-31-110-9 ~]$ aws dynamodb list-tables --region us-east-1
{
    "TableNames": [
        "app-db",
        "terraform-locks"
    ]
}
```

### Final Infrastructure Outputs

```text
[ec2-user@ip-172-31-110-9 ~]$ terraform output
alb_dns_name = "app-lb-1701439727.us-east-1.elb.amazonaws.com"
dynamodb_table_name = "app-db"
s3_bucket_name = "demo-app-storage-vishnu-2026"
```
