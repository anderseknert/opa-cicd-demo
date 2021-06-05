# styra-tf-demo

## Running

terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
styra vet tfplan.json

