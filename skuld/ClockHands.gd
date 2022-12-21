extends CharacterState

func _frame_0():
	var proj_x = 10
	var proj_y = -16 
	var lockon = host.opponent.get_hurtbox_center()
	
	#var dir = host.obj_local_center(host.opponent)
	#dir = fixed.normalized_vec(str(dir.x), str(dir.y))
	var dir = xy_to_dir(data["x"], data["y"])
	var shot_dir = fixed.normalized_vec_times(dir.x, dir.y, "-1")
	var offset = fixed.normalized_vec_times(dir.x, dir.y, "-1")
	
	proj_x = int(fixed.add(str(lockon.x), offset.x))
	proj_y = int(fixed.add(str(lockon.y), offset.y))
	
	
	var obj = host.spawn_object(preload("res://characters/skuld/projectiles/ClockHands.tscn"), proj_x, proj_y, false, {"dir":dir})
