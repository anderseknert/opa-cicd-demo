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
opa eval --format pretty --fail-defined --input tfplan.json --data policy/main.rego 'data.main.deny[x]'
```

### conftest test

```shell
conftest test tfplan.json
```

### Styra

```shell
styra vet tfplan.json
```
