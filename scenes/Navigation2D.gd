extends Navigation2D

export(float) var CHARACTER_SPEED = 50.0
onready var god : Node = $SpritesSorting


func _process(delta):
	var children : Array = god.get_children()
	var children_that_are_people : Array = []
	for i in children:
		if i.is_in_group("People"):
			children_that_are_people.append(i)
			if i.exit != null:
				var walk_distance = CHARACTER_SPEED * delta
				move_along_path(walk_distance, i)


func _update_navigation_path(aPeople : Node2D):
	var path = get_simple_path(aPeople.position, aPeople.exit.position, true)
	path.remove(0)
	aPeople.path = path 
	set_process(true)


func move_along_path(distance, toMove):
	var last_point = toMove.position
	for index in range(toMove.path.size()):
		var distance_between_points = last_point.distance_to(toMove.path[0])
		if distance <= distance_between_points and distance >= 0.0:
			toMove.position = last_point.linear_interpolate(toMove.path[0], distance / distance_between_points)
			break
		elif distance < 0.0:
			toMove.position = toMove.path[0]
			set_process(false)
			break
		distance -= distance_between_points
		last_point = toMove.path[0]
		toMove.path.remove(0)
