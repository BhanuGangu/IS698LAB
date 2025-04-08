# **AWS Infrastructure Deployment with Terraform**  
**Automated provisioning of a secure VPC, EC2 web server, S3 bucket, and DynamoDB table**  

---

## **📌 Table of Contents**  
1. [Project Overview](#-project-overview)  
2. [Infrastructure Diagram](#-infrastructure-diagram)  
3. [Prerequisites](#-prerequisites)  
4. [Quick Start](#-quick-start)  
5. [Module Details](#-module-details)  
6. [Customization](#-customization)  
7. [Security](#-security)  
8. [Troubleshooting](#-troubleshooting)  
9. [Cleanup](#-cleanup)  

---

## **🌐 Project Overview**  
This Terraform project automates the deployment of:  
✅ **VPC** with public/private subnets  
✅ **EC2 instance** (NGINX web server in private subnet)  
✅ **S3 bucket** (encrypted static file storage)  
✅ **DynamoDB table** (user data storage)  

**Use Case**: Ideal for deploying secure web applications with backend storage.  

---

## **📊 Infrastructure Diagram**  


---

## **⚙️ Prerequisites**  
1. **AWS Account** with IAM permissions  
2. **Terraform** v1.4.0+ ([Install guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))  
3. **AWS CLI** configured (`aws configure`)  
4. **Existing EC2 Key Pair** ([Create one](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html))  

---

## **🚀 Quick Start**  
### **1. Clone the repo**  
```bash
git clone https://github.com/BhanuGangu/IS698LAB/new/main/aws_hw2
```

### **2. Configure variables**  
Edit `terraform.tfvars`:  
```terraform
key_name    = "your-ssh-key-name"     # Existing EC2 key pair
bucket_name = "your-unique-bucket"    # Must be globally unique
region      = "us-east-1"             # AWS region
env         = "dev"                   # Environment tag
```

### **3. Deploy**  
```bash
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

---

## **🧩 Module Details**  
| Module       | Resources Created | Key Features |  
|--------------|-------------------|--------------|  
| **Networking** | VPC, Subnets, IGW, NAT, Security Groups | Isolated private subnet, restricted SSH access |  
| **Compute**    | EC2 Instance (t2.micro) | Auto-installs NGINX, uses existing key pair |  
| **Storage**    | S3 Bucket | Versioning, AES-256 encryption |  
| **Database**   | DynamoDB Table | Pay-per-request, `UserID` partition key |  

---

## **🔧 Customization**  
### **Variable Overrides**  
| Variable        | Description | Default Value |  
|-----------------|-------------|---------------|  
| `vpc_cidr`      | VPC IP range | `10.0.0.0/16` |  
| `instance_type` | EC2 size | `t2.micro` |  
| `enable_versioning` | S3 versioning | `true` |  

**Example**: Override via CLI:  
```bash
terraform apply -var="instance_type=t2.micro"
```

---

## **🔒 Security**  
- **EC2**: Deployed in private subnet with SSH restricted to your IP  
- **S3**: Bucket policies block public access, encryption enabled  
- **DynamoDB**: IAM role-based access only  
- **No hardcoded secrets**: All credentials passed via variables  

---

## **🐛 Troubleshooting**  
| Error | Solution |  
|-------|----------|  
| `InvalidKeyPair.NotFound` | Verify key exists in AWS Console → [EC2 Key Pairs](https://console.aws.amazon.com/ec2/v2/home#KeyPairs) |  
| `BucketAlreadyExists` | Change `bucket_name` in `terraform.tfvars` |  
| `AccessControlListNotSupported` | Delete `aws_s3_bucket_acl` resource |  

---

## **🧹 Cleanup**  
To destroy all resources:  
```bash
terraform destroy
```

**Warning**: This will permanently delete all AWS resources created by this project!  

---

**Happy deploying!** 🚀  

--- 

**📝 Notes**:  
- Replace placeholder values (e.g., `your-repo`, `your-ssh-key-name`) with your actual data  
- For production, use **remote state storage** (S3 backend) and **Terraform Cloud** for collaboration
