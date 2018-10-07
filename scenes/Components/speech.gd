extends CollisionShape2D

func show_sprite_dialog_to_rand_pos(input : Sprite) -> void:
	input.run_fade_out()
	var rand_pos : Vector2 = rand_vect2_from_extent(get_shape().get_extents()) 
	input.set_position(rand_pos)
	if rand_pos.x < 0:
		input.set_rotation_degrees(-15)
	else:
		input.set_rotation_degrees(15)
	input.set_z_index(10)
	add_child(input)
	
	
func rand_vect2_from_extent(input : Vector2) -> Vector2:
	return Vector2(rand_range(-input.x,input.x),rand_range(-input.y, input.y))
	
