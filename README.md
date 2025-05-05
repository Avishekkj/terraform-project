# AWS Infrastructure and EKS Cluster with Terraform

This repository contains Terraform code to provision and manage AWS infrastructure, including a **Virtual Private Cloud (VPC)**, **public and private subnets**, **route tables**, **NAT Gateway**, and an **EKS cluster**. The infrastructure is modularized to enhance scalability and reusability. This project also includes best practices for Terraform state management with backend and locking logic.

## Project Overview

### 1. **VPC & Networking Setup**
The VPC project provisions a comprehensive AWS environment using Terraform, which includes:

- **VPC**: A Virtual Private Cloud (VPC) is created with both public and private subnets spread across multiple Availability Zones (AZs).
- **NAT Gateway**: A NAT Gateway is configured to allow private instances to access the internet securely.
- **Route Tables**: Custom route tables are created for public and private subnets, ensuring proper routing of traffic.
- **Security Groups**: Specific security groups for ingress and egress traffic are configured to control access to the instances and services.

The VPC project ensures a secure and isolated environment to host various services and workloads.

### 2. **EKS Cluster Deployment**
The EKS project sets up an Amazon EKS (Elastic Kubernetes Service) cluster within the AWS VPC, designed for hosting containerized applications. It includes the following:

- **EKS Cluster Creation**: A fully managed Kubernetes cluster is provisioned within the AWS VPC.
- **Security Groups**: Custom ingress and egress security groups are created for the EKS cluster to manage access to and from the cluster.
- **Kubernetes Node Groups**: Managed node groups are configured to run containerized workloads within the cluster.
- **Modular Approach**: This project is modularized to ensure reusable and scalable configurations for the EKS cluster, security groups, and other resources.

The EKS cluster is deployed to support container orchestration, ensuring high availability and resilience for the deployed applications.

### 3. **Backend & Locking**
To ensure safe and collaborative use of Terraform, the project implements a backend with the following features:

- **Remote State Management**: The state file is stored remotely using Amazon S3, ensuring it is accessible and secure.
- **State Locking**: Terraform state locking is implemented using DynamoDB, preventing concurrent modifications during infrastructure changes.

### 4. **Modular Approach**
The project is organized in a modular way, which allows for better separation of concerns and easier management of different infrastructure components. The modules include:

- **VPC Module**: Responsible for creating the VPC, subnets, route tables, and security groups.
- **EKS Module**: Handles the provisioning of the EKS cluster and associated resources like node groups and security groups.
- **NAT Gateway Module**: Manages the creation of the NAT Gateway and its integration with the VPC’s route tables.

## Features

- **Scalable Infrastructure**: Fully scalable AWS infrastructure with VPC, subnets, NAT Gateway, and EKS Cluster.
- **Modular Design**: Terraform modules for easy maintenance and reusability.
- **State Management**: Uses S3 and DynamoDB for secure remote state storage and locking.
- **Security**: Includes secure security group configurations for controlling traffic to the EKS cluster and other resources.
- **Infrastructure as Code**: All infrastructure is provisioned and managed using Terraform, promoting version control and automation.

## Conclusion

This project provides a comprehensive solution for deploying AWS infrastructure with Terraform, including VPC setup, private/public subnets, EKS cluster, and security configurations. It emphasizes best practices such as remote state management, modular code, and secure access controls.
