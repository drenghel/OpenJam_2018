extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	is_physics_processing();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction : Vector2 = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		direction.x += speed
	elif Input.is_action_pressed("ui_up"):
		direction.y += speed
	elif Input.is_action_pressed("ui_left"):
		direction.x -= speed
	elif Input.is_action_pressed("ui_down"):
		direction.y -= speed
	
	self.move_and_slide(direction)