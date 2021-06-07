# styra-tf-demo

## Running

Run `plan.sh`, or:

```shell
terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
#styra vet tfplan.json
```

## Conftest tests

`conftest test --policy conftest main.tf`