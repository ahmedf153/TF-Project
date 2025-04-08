# 🚀 Terraform AWS Multi-Tier Architecture

This project sets up a complete **multi-tier infrastructure on AWS** using Terraform with:

- VPC (with public and private subnets across 2 AZs)
- Public + Private Load Balancers
- 2 Nginx Proxy EC2 instances (public)
- 2 Apache Backend EC2 instances (private)
- Remote state backend using S3 + DynamoDB
- Modular Terraform structure

---

## 📁 Project Structure
![image](https://github.com/user-attachments/assets/dd1571aa-da8c-47c0-a01b-0b411dbab0e9)
## 🧱 Modules Overview

| Module         | Description                            |
|----------------|----------------------------------------|
| `vpc/`         | VPC, route tables, internet gateway    |
| `subnets/`     | 2 Public + 2 Private subnets           |
| `security-groups/` | SGs for LB, proxy, and backend EC2s  |
| `loadbalancer/`| Public & Private ALB + target groups   |
| `instance-m/`  | Launches 4 EC2 instances with user_data |

---

## ☁️ Architecture Summary

- **Public Load Balancer** → routes to 2 Nginx Proxies (public subnet)
- **Private Load Balancer** → routes to 2 Apache Backends (private subnet)
- **Each instance is in a separate AZ**
terraform {
  backend "s3" {
    bucket         = "ahmed-1533-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock2"
  }
}
