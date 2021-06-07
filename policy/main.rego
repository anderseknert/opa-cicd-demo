package main

changesets[address] = changeset {
	changeset := input.resource_changes[i]
    address := changeset.address
}

deny[msg] {
	changeset := changesets[address]

    changeset.type == "aws_s3_bucket"
    changeset.change.after.acl != "private"

	msg := sprintf("S3 bucket '%v' has a non-private acl value", [changeset.name])
}