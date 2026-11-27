# Simple Azure Terraform Setup

A Terraform configuration that provisions an Azure Resource Group, Storage Account, Virtual Network, Network Security Group, Public IP, and an Ubuntu 24.04 LTS Linux Virtual Machine.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) `>= 1.5.0`
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) authenticated to your subscription (`az login`)

## What It Creates

- **Resource Group** (`rg-<project>-<env>`)
- **Storage Account** (`st<project><env><random>`)
- **Virtual Network & Subnet** (`10.0.0.0/16`, subnet `10.0.1.0/24`)
- **Network Security Group** (allows inbound SSH on port 22 and HTTP on port 80)
- **Public IP & Network Interface** (Standard static IP)
- **Linux Virtual Machine** (Ubuntu 24.04 LTS, `Standard_B1s` by default, SSH key authentication)

## Usage

1. Copy the example variables file and adjust values:

   ```powershell
   Copy-Item terraform.tfvars.example terraform.tfvars
   ```

2. Initialize Terraform:

   ```powershell
   terraform init
   ```

3. Preview the execution plan:

   ```powershell
   terraform plan
   ```

4. Apply the configuration:

   ```powershell
   terraform apply
   ```

5. Destroy resources when no longer needed:

   ```powershell
   terraform destroy
   ```
