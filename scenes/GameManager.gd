extends Node

onready var stash : Node2D = get_node("SpritesSorting/Stash")
onready var charHand : Node2D = get_node("SpritesSorting/Character/hand_component")
onready var popup : Popup = get_node("CanvasLayer/Accept_victory")

func _ready():
	stash.connect("is_full_signal", self, "check_for_victory")
	charHand.connect("is_empty_signal", self, "check_for_victory")
	popup.connect("confirmed", get_tree(), "quit")
	popup.connect("popup_hide", get_tree(), "quit")

func displayVictory():
	print("Consumerism wins !")
	print(get_tree())
	get_tree().paused = true
	popup.popup()
	$CanvasLayer/Accept_victory/CenterContainer/victory_message/AnimationPlayer.play("text_anim")

func check_for_victory():
	print(stash.papers_count,charHand.current_stack.size())
	if stash.papers_count == 0 && charHand.current_stack.empty():
		displayVictory()