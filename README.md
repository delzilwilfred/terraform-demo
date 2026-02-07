# Terraform using AWS VPC + EC2 Web Server

This project demonstrates how to build and deploy a complete AWS infrastructure using **Terraform (Infrastructure as Code)**. The setup includes a custom VPC, EC2 instance, and an automated web server deployment.

## 🚀 Project Overview

Using Terraform, this project provisions a production-style AWS environment with networking and compute resources fully managed through code.

## 🛠️ Technologies Used

* **Terraform**
* **AWS (VPC, EC2, Security Groups, Route Tables)**
* **Linux (Amazon Linux / Ubuntu)**
* **Web Server (Apache / Nginx)**

## 🧱 Infrastructure Components

* Custom **VPC**
* **Public Subnet**
* **Internet Gateway**
* **Route Table** with internet access
* **Security Groups** for inbound/outbound rules
* **EC2 Instance**
* Automated **Web Server installation** using user data
* **SSH Key Pair** managed via Terraform

## 📁 Project Structure

```
terraform-demo/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── ec2.tf
└── vpc.tf
```

## ⚙️ Prerequisites

* AWS Account
* IAM User with required permissions
* Terraform installed
* AWS CLI configured

## 🔑 AWS Configuration

Configure your AWS credentials using:

```
aws configure
```

Set your region (example):

```
us-east-1 
```

## ▶️ How to Deploy

Clone the repository:

```
git clone https://github.com/delzilwilfred/terraform-demo.git
cd terraform-demo
```

Initialize Terraform:

```
terraform init
```

Validate configuration:

```
terraform validate
```

Apply the infrastructure:

```
terraform apply
```

Confirm by typing `yes`.

## 🌐 Access the Web Server

After deployment, Terraform will output the **public IP** of the EC2 instance. Open it in your browser:

```
http://<EC2_PUBLIC_IP>
```

## 🧹 Cleanup Resources

To destroy all created resources:

```
terraform destroy
```

## 📚 Key Learnings

* End-to-end AWS infrastructure provisioning using Terraform
* Hands-on experience with AWS networking (VPC, Subnets, IGW)
* Importance of Infrastructure as Code for repeatable deployments
* Automating server provisioning instead of manual configuration

## 🔮 Future Enhancements

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Remote backend using S3 + DynamoDB
* Modular Terraform structure
* CI/CD integration

## 📌 Author

**Henry Daniel**
Aspiring DevOps / Cloud Engineer

---

⭐ If you find this project useful, feel free to star the repository!
