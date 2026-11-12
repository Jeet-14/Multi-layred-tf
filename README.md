# IBM Cloud Schematics — regional Resource Group test

A deliberately minimal Terraform example for testing the pattern:

- One Schematics workspace manages exactly one deployment target in one region.
- Environment, region, and resource-group naming are committed in `locals.tf`.
- The only Terraform input is `ibmcloud_api_key`, configured as a **sensitive** Schematics workspace variable.
- The reusable resource-group implementation lives in `modules/resource-group`.
- No VPC, COS, ROKS, deployment orchestration, tfvars, or other infrastructure is included.

## Schematics workspace setup

1. Push this directory to a Git repository.
2. Create a Schematics workspace using that repository.
3. Set the Terraform working directory to:

   `environments/stage/us-south/resource-group`

4. Add one workspace variable:
   - Name: `ibmcloud_api_key`
   - Value: your IBM Cloud API key
   - Mark it **Sensitive**
5. Run Generate plan, review it, and Apply.

The workspace must target the intended IBM Cloud account. The API key authenticates to that account; the account itself is not selected by `locals.tf`.

## Create another regional workspace

Copy `environments/stage/us-south/resource-group` to a new path, for example:

`environments/prod/eu-de/resource-group`

Edit only `locals.tf` in the copied folder:

```hcl
locals {
  environment = "prod"
  region      = "eu-de"

  resource_group_name = "psl-sre-${local.environment}-${local.region}"
}
```

Create a separate Schematics workspace pointing at the new working directory and provide that target account's API key as its sensitive variable. Each workspace gets its own state.

## Local validation

From the regional working directory:

```bash
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
```

Do not commit API keys, state files, or plan files.
