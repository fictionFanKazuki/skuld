extends CharacterState

func _frame_0():
	var dir = host.obj_local_center(host.opponent)
	dir = fixed.normalized_vec(str(dir.x), str(dir.y))
	var obj = host.spawn_object(preload("res://characters/skuld/projectiles/ClockHands.tscn"), -40, -75, true, {"dir":dir})
