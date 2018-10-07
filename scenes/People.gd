extends KinematicBody2D

export var difficulty : float

func receive_ad() -> bool:
	var roll : int = rand_range(0, 100)
	print("rolled : ", roll)
	if roll > difficulty:
		return true
	else:
		print("lol nope")
		return false	