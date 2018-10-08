extends KinematicBody2D

export var difficulty : float

onready var speech = $speech
const speech_node_ok : Resource = preload("res://scenes/speech_ok.tscn")
const speech_node_nok : Resource = preload("res://scenes/speech_nok.tscn")

var exit : Position2D
var path = []

func receive_ad() -> bool:
	var roll : int = rand_range(0, 100)
	if $hand.current_stack.size() < $hand.max_in_hand:
		if roll > difficulty:
			$hand.add_one_ad_in_hand()
			speech.show_sprite_dialog_to_rand_pos(speech_node_ok.instance())
			return true
		else:
			speech.show_sprite_dialog_to_rand_pos(speech_node_nok.instance())
			return false;
	else:
		print("Already got one")
		return false	