extends Node2D

var add_resource : Resource = preload("res://scenes/Components/FilthyAd.tscn")
var current_stack : Array
export var max_in_hand : int

func _ready():
	current_stack = []

func remove_one_ad_from_hand() -> bool:
	if current_stack.size() != 0:
		current_stack.pop_back().queue_free()
		return true
	else:
		return false
	
func get_advert_instance() -> Sprite:
	return add_resource.instance()
	
func add_one_ad_in_hand():
	if current_stack.size() < max_in_hand:
		var instance = get_advert_instance()
		var newPos : Vector2 = Vector2.ZERO
		if get_child_count() !=  0:
			newPos = get_child(get_child_count() - 1).get_position()
			newPos.y = newPos.y - 2
		instance.set_position(newPos)
		current_stack.append(instance)
		add_child(instance)
	else:
		printerr(self, " - " , " has already maxed out")
