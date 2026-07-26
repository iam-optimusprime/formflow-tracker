# 💰 Formflow Expense Tracker

> A production-style, containerized three-tier Expense Tracking application called `formflow`, demonstrating modern Cloud Engineering and DevOps practices using Docker, Terraform, GitHub Actions, and Microsoft Azure.

---

# Project Overview

This project was developed as a Cloud & DevOps Engineering Capstone to demonstrate the complete Software Development Lifecycle (SDLC), from infrastructure provisioning to automated application deployment.

The solution follows a Three-Tier Architecture:

- Presentation Layer (Next.js Frontend)
- Application Layer (Express.js Backend API)
- Data Layer (PostgreSQL Database)

The infrastructure is provisioned using Terraform and validated with Bash automation scripts. Continuous Integration and Continuous Deployment (CI/CD) are implemented using GitHub Actions, Docker, and Docker Hub, with deployment to an Azure Linux Virtual Machine.

---

# Solution Architecture

```text
                         Internet
                             │
                             │
                    Azure Public IP
                             │
                    Ubuntu Linux VM
                             │
          ┌──────────────────┼──────────────────┐
          │                  │                  │
          ▼                  ▼                  ▼
    Frontend Container   Backend Container   PostgreSQL
        (Next.js)          (Express.js)      (Database)
                │                │
                └────────────────┘
                 Docker Bridge Network
```

---

# CI/CD Architecture

```text
Developer

      │

git push

      │

GitHub Repository

      │

────────────── CI ──────────────

Checkout Code

↓

Install Dependencies

↓

Build Application

↓

Validate Docker Images

↓

PASS

────────────────────────────────

Create Release

↓

git tag v1.0.0

↓

GitHub Actions Release Pipeline

↓

Docker Build

↓

Docker Push

↓

SSH to Azure VM

↓

deploy.sh

↓

Docker Compose

↓

Health Check

↓

Production
```

---

# Technology Stack

## Frontend

- Next.js
- React
- JavaScript

## Backend

- Express.js
- Node.js
- Prisma ORM

## Database

- PostgreSQL

## Infrastructure

- Microsoft Azure
- Azure Virtual Machine
- Azure Virtual Network
- Azure Network Security Group
- Azure Public IP

## Infrastructure as Code

- Terraform

## Infrastructure Automation

- Bash

## Containerization

- Docker
- Docker Compose

## CI/CD

- GitHub Actions
- Docker Hub

---

# Repository Structure

```text
expense-tracker/
│
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── release.yml
│
├── backend/
│
├── frontend/
│
├── infrastructure/
│   │
│   ├── terraform/
│   │   ├── environments/
│   │   ├── modules/
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── versions.tf
│   │   └── README.md
│   │
│   └── bash/
│       ├── deploy-infrastructure.sh
│       ├── destroy-infrastructure.sh
│       ├── validate.sh
│       └── smoke-test.sh
│
├── scripts/
│   ├── deploy.sh
│   ├── rollback.sh
│   ├── cleanup.sh
│   └── healthcheck.sh
│
├── docs/
│
├── docker-compose.yml
│
├── .env.example
│
├── README.md
│
└── LICENSE
```

---

# Cloud Infrastructure

The infrastructure is provisioned using Terraform.

Provisioned Azure Resources include:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Public IP Address
- Ubuntu Linux Virtual Machine

Infrastructure provisioning follows Infrastructure as Code (IaC) principles for repeatability, consistency, and version control.

---

# Infrastructure Automation

Bash scripts are included to demonstrate infrastructure validation and operational automation.

Examples include:

- Infrastructure validation
- Smoke testing
- Deployment verification
- Infrastructure cleanup

These scripts complement Terraform by automating operational tasks after infrastructure provisioning.

---

# Docker Architecture

Each application component runs inside its own container.

```text
Frontend Container

↓

Backend Container

↓

PostgreSQL Container
```

All services communicate over an isolated Docker bridge network.

---

# CI Pipeline

The Continuous Integration pipeline performs:

- Source checkout
- Dependency installation
- Prisma generation
- Backend build
- Frontend build
- Docker image validation

The objective is to verify code quality before release.

---

# CD Pipeline

The Continuous Deployment pipeline performs:

- Trigger on Semantic Version tag
- Docker image build
- Docker image push
- SSH into Azure VM
- Execute deployment script
- Pull latest images
- Restart containers
- Perform health checks
- Automatic rollback (if deployment fails)

---

# Deployment Scripts

The deployment process is modularized into individual Bash scripts.

| Script         | Purpose                        |
| -------------- | ------------------------------ |
| deploy.sh      | Deploy new application version |
| rollback.sh    | Restore previous release       |
| healthcheck.sh | Verify application health      |
| cleanup.sh     | Remove unused Docker resources |

---

# Local Development

Clone the repository

```bash
git clone <repository-url>
```

Navigate into the project

```bash
cd expense-tracker
```

Configure environment variables

```bash
cp .env.example .env
```

Run Docker Compose

```bash
docker compose up -d
```

---

# Infrastructure Deployment

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Preview infrastructure

```bash
terraform plan
```

Provision infrastructure

```bash
terraform apply
```

---

# Release Process

Create a Semantic Version

```bash
git tag v1.0.0
```

Push the release

```bash
git push origin v1.0.0
```

GitHub Actions automatically:

- Builds Docker images
- Pushes images to Docker Hub
- Deploys the application
- Executes health checks

---

# Cloud VM Structure

```text
/home/azureuser/

expense-tracker/

├── backend/

├── frontend/

├── docker-compose.yml

├── .env

├── .previous_version

├── deployments.log

└── scripts/
```

---

# Screenshots

> Replace the placeholders below with screenshots after deployment.

- GitHub Actions Workflow
- Docker Hub Repository
- Azure Virtual Machine
- Docker Compose
- Running Containers
- Expense Tracker Application
- Health Endpoint
- Release Tag
- Terraform Apply
- Infrastructure Provisioning

---

# Team Members

| Name       | Responsibility                                   |
| ---------- | ------------------------------------------------ |
| <Member 1> | Frontend Development                             |
| <Member 2> | Backend Development                              |
| <Member 3> | Database Design                                  |
| <Member 3> | DevOps, Docker, CI/CD, Infrastructure Automation |
| <Member 5> | Infrastructure Provisioning                      |
| <Member 6> | Documentation                                    |

---

# Future Improvements

Potential enhancements include:

- Kubernetes deployment
- Azure Container Registry
- Azure Application Gateway
- Azure Key Vault
- Monitoring with Prometheus and Grafana
- Centralized logging with Loki
- Blue-Green deployment
- Canary releases
- Multi-stage deployment environments
- Automated database migrations

---

# License

This project was developed for educational purposes as part of a Cloud & DevOps Engineering Capstone Project.
