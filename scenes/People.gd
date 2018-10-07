extends KinematicBody2D

export var difficulty : float

func receive_ad() -> bool:
	var roll : int = rand_range(0, 100)
	if $hand.current_stack.size() < $hand.max_in_hand:
		if roll > difficulty:
			$hand.add_one_ad_in_hand()
			return true
		else:
			print("Don't want one !")
			return false;
	else:
		print("Already got one")
		return false	