package main

import data.util.changesets_by_type

deny[msg] {
	msg := data.terraform[type].deny[_] with input.changesets as changesets_by_type[type]
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
