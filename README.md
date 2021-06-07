# styra-tf-demo

## Running

Run `plan.sh`, or:

```shell
terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
```

## Testing state changes

### opa eval

```shell
opa eval --fail-defined --input tfplan.json --data policy/main.rego 'data.main.deny'
```

### conftest test

```shell
conftest test tfplan.json
```

### Styra

```shell
styra vet tfplan.json
```
