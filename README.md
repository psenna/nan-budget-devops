# nan-budget-devops
How to create a kubernetes, CI/CD, etc with a NaN budget in OCI

## Credentials

```
# terraform.tfvars
tenancy_ocid            = ""
user_ocid               = "your user ocid"
private_key_fingerprint = ""
private_key_path        = "~/someplace/private_key_file.pem"
oci_region              = "region"
```

## Submodules

* Security = Compartments, users, groups, policies, keys.
* network = VCP, subnets, gateways, Security Lists, route tables.