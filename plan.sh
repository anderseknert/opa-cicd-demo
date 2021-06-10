#!/usr/bin/env bash

terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
rm tfplan.binary