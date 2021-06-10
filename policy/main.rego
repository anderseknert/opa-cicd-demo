package main

changesets[address] = changeset {
	changeset := input.resource_changes[i]
	address := changeset.address
}

deny[msg] {
	changeset := changesets[address]

	changeset.type == "aws_s3_bucket"
	changeset.change.after.acl != "private"

	msg := sprintf("Bucket '%v' has a non-private acl value", [changeset.name])
}

deny[msg] {
    changeset := changesets[address]

    required_tags := {"Owner", "Department"}
    provided_tags := {tag | changeset.change.after.tags[tag]}

    missing_tags := required_tags - provided_tags
    missing_tag := missing_tags[_]

	msg := sprintf("Missing %v tag on %v", [missing_tag, address])
}
