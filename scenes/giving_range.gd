extends Area2D

func find_first_reservoir_in_list() -> Node2D:
	for aNode in get_overlapping_bodies():
		if aNode is StaticBody2D && aNode.is_in_group("Stash"):
			return aNode
	return null	