extends Node2D

var add_resource : Resource = preload("res://scenes/Components/FilthyAd.tscn")
var current_stack : Array
export var max_in_hand : int
onready var giving_range : Area2D = get_node("../giving_range")


func _process(delta):
	if Input.is_action_just_pressed("game_reload"):
		if not try_to_reload():
			print("no reservoir in range")


func try_to_reload() -> bool:
	var first_reservoir : Node2D = giving_range.find_first_reservoir_in_list()
	if first_reservoir:
#		print("reloading ", max_in_hand - current_stack.size(), " ads")
		for x in range(current_stack.size(), max_in_hand):
			add_one_ad_in_hand_visually()
		return true
	return false
	
func try_to_give_to(receiver : KinematicBody2D):
	if receiver.is_in_group("People") && receiver.has_method("receive_ad"):
		if receiver.receive_ad():
			if not remove_one_ad_from_hand():
				print("No ad to give left !")
			

# ----------------------------------------------- Private

func remove_one_ad_from_hand() -> bool:
	if current_stack.size() != 0:
		current_stack.pop_back().queue_free()
		return true
	else:
		return false
	
func get_advert_instance() -> Sprite:
	return add_resource.instance()
	
func add_one_ad_in_hand_visually():
	var instance = get_advert_instance()
	var newPos : Vector2 = Vector2.ZERO
	if get_child_count() !=  0:
		newPos = get_child(get_child_count() - 1).get_position()
		newPos.y = newPos.y - 2
	instance.set_position(newPos)
	current_stack.append(instance)
	add_child(instance)