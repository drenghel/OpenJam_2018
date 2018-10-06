extends Node2D

var add_resource : Resource = preload("res://scenes/FilthyAd.tscn")
var current_stack : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func try_to_reload():
	for x in range(0,5):
		var instance = get_advert_instance()
		var newPos : Vector2 = Vector2.ZERO
		if get_child_count() !=  0:
			newPos = get_child(get_child_count() - 1).get_position()
			newPos.y = newPos.y - 2
		print(newPos)
		instance.set_position(newPos)
		current_stack.append(instance)
		add_child(instance)
	print(current_stack.size())
	
func get_advert_instance() -> Sprite:
	return add_resource.instance()