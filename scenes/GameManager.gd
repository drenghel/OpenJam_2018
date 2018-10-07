extends Node

onready var stash : Node2D = get_node("SpritesSorting/Stash")
onready var charHand : Node2D = get_node("SpritesSorting/Character/hand_component")

func _ready():
	stash.connect("is_full_signal", self, "check_for_victory")
	charHand.connect("is_empty_signal", self, "check_for_victory")


func displayVictory():
	print("Consumerism wins !")
	
func check_for_victory():
	if stash.papers_count == 0 && charHand.current_stack.empty():
		displayVictory()