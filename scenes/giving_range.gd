extends Area2D

func find_first_reservoir_in_list() -> Node2D:
	for aNode in get_overlapping_bodies():
		if aNode is StaticBody2D && aNode.is_in_group("Stash"):
			return aNode
	return null	
	
func find_first_people_in_range() -> StaticBody2D:
	for aNode in get_overlapping_bodies():
		if aNode is KinematicBody2D && aNode.is_in_group("People"):
			return aNode
	return null	