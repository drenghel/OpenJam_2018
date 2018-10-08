extends Node

onready var stash : Node2D = get_node("Navigation2D/SpritesSorting/Stash")
onready var charHand : Node2D = get_node("Navigation2D/SpritesSorting/Character/hand_component")
onready var popup : Popup = get_node("CanvasLayer/Accept_victory")
const ppl_res : Resource = preload("res://scenes/People.tscn")

func _ready():
	stash.connect("is_full_signal", self, "check_for_victory")
	charHand.connect("is_empty_signal", self, "check_for_victory")
	popup.connect("confirmed", get_tree(), "quit")
	popup.connect("popup_hide", get_tree(), "quit")
	
	
	$SpawnTimer.connect("timeout", self, "spawnPeople")

func displayVictory():
	print("Consumerism wins !")
	get_tree().paused = true
	popup.popup()
	$CanvasLayer/Accept_victory/CenterContainer/victory_message/AnimationPlayer.play("text_anim")

func check_for_victory():
	if stash.papers_count == 0 && charHand.current_stack.empty():
		displayVictory()
		
func spawnPeople():
	var where : Vector2 = returnRandChild($Navigation2D/MainTile/spawns).position
	var whereTo : Position2D = returnRandChild($Navigation2D/MainTile/exits)
	var aPeople : Node2D = ppl_res.instance()
	aPeople.exit = whereTo
	aPeople.set_position(where)
	$Navigation2D._update_navigation_path(aPeople)
	$Navigation2D/SpritesSorting.add_child(aPeople)
	
func returnRandChild(input : Node) -> Node:
	return input.get_child(rand_range(0, input.get_child_count()))
	