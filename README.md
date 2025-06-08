# Terraform Remote Backend Demo

This project demonstrates how to use a remote backend with Terraform for managing infrastructure state securely and collaboratively.

## Overview

- **Provider:** AWS
- **Resources:**
  - EC2 Instance (Ubuntu)
  - S3 Bucket (for remote state storage)
  - DynamoDB Table (for state locking)

## Files

- `main.tf`: Defines AWS resources (EC2, S3, DynamoDB).
- `backend.tf`: (Not shown here) Should configure the remote backend using the S3 bucket and DynamoDB table.

## Remote Backend Setup

A remote backend allows Terraform to store its state file in a central location (S3) and use DynamoDB for state locking and consistency.

### Example `backend.tf` (for reference):

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-xyz-12345"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
```

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```
2. **Plan Infrastructure:**
   ```bash
   terraform plan
   ```
3. **Apply Infrastructure:**
   ```bash
   terraform apply
   ```

## Notes
- Ensure the S3 bucket name is globally unique.
- The DynamoDB table is used for state locking to prevent concurrent modifications.
- Update the `ami`, `subnet_id`, and other resource parameters as needed for your environment.

## Clean Up
To destroy all resources created by this demo:
```bash
terraform destroy
```

---

**This is a demo for using remote backends in Terraform.**
