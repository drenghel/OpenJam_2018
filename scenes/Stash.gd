extends StaticBody2D

export var papers_count_max : int
var papers_count : int

signal is_full_signal

enum state { 
			Empty = 0,
			TwentyFive = 25,
			FiftyFive = 50,
			SeventyFive = 75,
			Full = 100  }
			
const r_full : Resource = preload("res://assets/reservoir_full.png")
const r_75 : Resource = preload("res://assets/reservoir_75.png")
const r_50 : Resource = preload("res://assets/reservoir_50.png")
const r_25 : Resource = preload("res://assets/reservoir_25.png")
const r_empty : Resource = preload("res://assets/reservoir_empty.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(papers_count_max != 0)
	papers_count = papers_count_max
	set_state(Full)
	
	
func remove_paper(nb : int) -> bool:
	if papers_count > 0:
		papers_count -= nb
		update_sprite()
		return true
	else:
		printerr("paper_count is 0, can't remove")
		return false


func update_sprite():
	var percent : float = float(papers_count) / float(papers_count_max)
	percent *= 100
	set_state(percent)
	

func set_state(percent):
	if percent == 0:
		$CollisionShape2D/Sprite.texture = r_empty
		emit_signal("is_full_signal")
	elif percent > 0 && percent <= 25 :
		$CollisionShape2D/Sprite.texture = r_25
	elif percent > 25 && percent <= 50 :
		$CollisionShape2D/Sprite.texture = r_50
	elif percent > 50 && percent <= 75 :
		$CollisionShape2D/Sprite.texture = r_75
	elif percent > 75 && percent <= 100 :
		$CollisionShape2D/Sprite.texture = r_full
	else:
		print("error")
		
		