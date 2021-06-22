package terraform.aws_s3_bucket

import data.util.is_create_or_update
import input.changesets as changesets

deny[msg] {
	changeset := changesets[_]
	is_create_or_update(changeset.change.actions)
	changeset.change.after.acl != "private"

	msg := sprintf("S3 bucket %v has a non-private acl", [changeset.name])
}
