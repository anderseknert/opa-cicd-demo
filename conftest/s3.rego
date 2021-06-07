package main

deny[msg] {
    bucket := input.resource.aws_s3_bucket[name]

    bucket.acl != "private"

    msg := sprintf("S3 bucket '%v' has a non-private acl value", [name])
}

deny[msg] {
    bucket := input.resource.aws_s3_bucket[name]

    not bucket.server_side_encryption_configuration

    msg := sprintf("S3 bucket '%v' missing mandatory encryption configuration", [name])
}

deny[msg] {
    input.resource.aws_s3_bucket[name]

    not follows_naming_convention(name)

    msg := sprintf("S3 bucket '%v' not following naming convention", [name])
}

follows_naming_convention(name) = regex.match(`^[a-z\-]+$`, name)