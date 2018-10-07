extends "res://scenes/Components/hand.gd"

onready var giving_range : Area2D = get_node("../giving_range")

signal is_empty_signal

func try_to_reload() -> bool:
	var first_reservoir : Node2D = giving_range.find_first_reservoir_in_list()
	if first_reservoir:
		for x in range(current_stack.size(), max_in_hand):
			if first_reservoir.remove_paper(1):
				add_one_ad_in_hand()
		return true
	return false
	

	
func try_to_give_to(receiver : KinematicBody2D):
	if receiver.is_in_group("People") && receiver.has_method("receive_ad"):
		if receiver.receive_ad():
			if not remove_one_ad_from_hand():
				print("No ad to give left !")
			if current_stack.empty():
				emit_signal("is_empty_signal")
				

func _process(delta):
	if Input.is_action_just_pressed("game_reload"):
		if not try_to_reload():
			print("no reservoir in range")

