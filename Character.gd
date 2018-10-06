extends KinematicBody2D

var speed = 200
var giving_area : Area2D 
var text_area : RectangleShape2D
const take_it_01_res : Resource = preload("res://scenes/take_it_01.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	giving_area = $giving_range
	text_area = $text_area.get_shape()
	is_physics_processing();

func _process(delta):
	handle_inputs()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	handle_movement()
	
func handle_movement():
	var direction : Vector2 = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		direction.x += speed
	if Input.is_action_pressed("ui_up"):
		direction.y -= speed
	if Input.is_action_pressed("ui_left"):
		direction.x -= speed
	if Input.is_action_pressed("ui_down"):
		direction.y += speed
	
	self.move_and_slide(direction.clamped(speed))
	
func handle_inputs():
	if Input.is_action_just_pressed("game_action"):
		print("action !")
		try_to_give_ad()
		
		
func try_to_give_ad():
	print("\ttake it!")
	var instance : Sprite = take_it_01_res.instance()
	$text_area.add_child(instance)
	instance.run_fade_out()
	instance.set_position(rand_vect2_from_extent(text_area.get_extents()))
	
func rand_vect2_from_extent(input : Vector2) -> Vector2:
	return Vector2(rand_range(-input.x,input.x),rand_range(-input.y, input.y))
	
	

	