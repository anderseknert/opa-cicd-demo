package util

changesets_by_type := {type: changes |
	some i
	type := input.resource_changes[i].type
	changes := [changeset |
		some j
		input.resource_changes[j].type == type
		changeset := input.resource_changes[j]
	]
}

# For the full list of possible actions, see:
# https://www.terraform.io/docs/internals/json-format.html#change-representation

is_create_or_update(actions) {
	actions[_] == "create"
}

is_create_or_update(actions) {
	actions[_] == "update"
}
