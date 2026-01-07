# F5 SaaS (RE-CE) demo with terraform

## Overview
This Terraform project deploys following items:
- Docker host with Demo application (DVWA) on **PROXMOX** 
- CE single NIC Host in **PROXMOX** connected to F5 SaaS platform
- Virtual Server in **F5 Saas** including WAF profile

This repository is for demo or PoC show cases only!

The deployment will create a random id which is 
used for several objects for naming convention.


---

## Getting Started
The modules are available here : https://registry.terraform.io/providers/volterraedge/volterra/latest

## Prerequisites

Before using this Terraform project, ensure you have the following:

- **Terraform CLI** installed on your machine
- API Certificate (P12 file and URL) for **F5 SaaS** access
- An third-level-domain in F5 SaaS for service deplyoment (DNS Delegation)
  - In this case we use let's encrypt while configuring Autocert for TLS key material

Doc for API Certificate generation: https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials 

---

```
project-directory/
├── create_f5xc_ce_template.sh
├── LICENSE
├── output.tf
├── providers.tf
├── proxmox
│   ├── master_ci.tf
│   ├── master_vm.tf
│   ├── output.tf
│   ├── securemesh_v2_site.tf
│   ├── templates
│   │   └── user-data.tpl
│   ├── variables.tf
│   └── versions.tf
├── README.md
├── securemesh_v2_site.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
├── terraform.tfvars.example
├── variables.tf
├── versions.tf
└── xc-lb.tf.tmp
```

---

## Configuration Steps

### 1. Clone the Repository

```bash
git clone <repository_url>
cd <repository_name>
```

### 2. export F5 SaaS variables

"export" the env variables to authenticate via terraform:

```
export VES_P12_PASSWORD=<P12_cert_password>
export VOLT_API_URL=https://f5-emea-ent.console.ves.volterra.io/api
export VOLT_API_P12_FILE=/path/to/the/p12/file_api-creds.p12
```


### 3. Update Variables

#### Modify `terraform.tfvars`
```bash
cp terraform.tfvars.example terraform.tfvars
```
Update the values in `terraform.tfvars` to match your deployment needs.

Here are the main key variables to configure:

- **Planet wide Variables:**
  ```hcl
  
  prefix             = "prefix"
  ssh_public_key     = "ssh-ed25519 ...."

  pm_api_url          = "https://<proxmox api url>:8006/api2/json"
  pm_api_token_id     = "<proxmox api token>"
  pm_api_token_secret = "<proxmox api secret>"
  pm_target_nodes     = [ "prox1", "prox2", "prox3"]
  iso_storage_pool    = "cephfs"                # or local
  pm_storage_pool     = "cephpool"              # or local-lvm
  pm_clone            = "f5xc-ce-template"      # needs to be created. See README.md
  pm_pool             = ""

  f5xc_api_url        = "https://<tenant>.console.ves.volterra.io/api"
  f5xc_api_token      = "f5xc api token"
  f5xc_tenant         = "<tenant id>"
  f5xc_api_p12_file   = "<path to tenant.console.ves.volterra.io.api-creds.p12 file>

  ```

### 4. Initialize Terraform

Run the following command to initialize Terraform and download required providers:

```bash
terraform init
```

### 5. Plan the Deployment

Verify the configuration by running:

```bash
terraform plan
```

This command shows the resources Terraform will create.

### 6. Deploy the Resources

Apply the configuration to create resources in Azure:

```bash
terraform apply
```

Type `yes` to confirm the deployment or add the argument `--auto-approve`.

---

## Cleanup

To destroy all resources created by this project, run:

```bash
terraform destroy
```

Type `yes` to confirm the deletion or add the argument `--auto-approve`.

---

