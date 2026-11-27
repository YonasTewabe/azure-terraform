# Simple Azure Terraform Setup

A minimal Terraform configuration that provisions an Azure Resource Group and a Storage Account using the `azurerm` provider.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) `>= 1.5.0`
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) authenticated to your subscription (`az login`)

## Usage

1. Copy the example variables file and adjust values as needed:

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
