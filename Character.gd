extends KinematicBody2D

var speed = 200
var giving_area : Area2D 
const take_it_01_res : Resource = preload("res://scenes/take_it_01.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	giving_area = $giving_range

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
		var people_in_range : KinematicBody2D = giving_area.find_first_people_in_range()
		if people_in_range && people_in_range.get_node("hand").current_stack.size() != 1:
			try_to_give_ad(people_in_range)
		else:
			print("Nobody in range !")
			
		
		
func try_to_give_ad(people : KinematicBody2D):
	var instance : Sprite = take_it_01_res.instance()
	$speech.show_sprite_dialog_to_rand_pos(instance)
	$hand_component.try_to_give_to(people)
