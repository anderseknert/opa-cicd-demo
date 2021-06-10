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

deny[msg] {
    changeset := changesets[address]

    changeset.type == "aws_s3_bucket"

    required_tags := {"Owner", "Project", "Team"}
    provided_tags := {tag | changeset.change.after.tags_all[tag]}

    missing_tags := required_tags - provided_tags
    missing_tag := missing_tags[_]

    msg := sprintf("S3 bucket '%v' missing tag '%v'", [changeset.name, missing_tag])
}
