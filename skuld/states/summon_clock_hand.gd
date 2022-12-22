extends CharacterState

var projectile

func _frame_0():
	# these are just default spawn positions in case something goes wrong
	var proj_x = -200
	var proj_y = -200
	#var lockon = host.opponent.get_hurtbox_center()
	
	# cool linear algebra stuff i stole that you'll probably understand better
	var dir = xy_to_dir(data["x"], data["y"])
	#var shot_dir = fixed.normalized_vec_times(dir.x, dir.y, "-1")
	#var offset = fixed.normalized_vec_times(dir.x, dir.y, "-1")
	
	#proj_x = int(fixed.add(str(lockon.x), offset.x))
	#proj_y = int(fixed.add(str(lockon.y), offset.y))
	
	# okay so this gives us an index we can use to access objects associated with our character
	# (spawn_clock_hands is defined in skuld.gd)
	projectile = host.spawn_clock_hand(proj_x, proj_y, dir)
	
#func _frame_3():
	# which we make use over here to be able to access the ClockHands object defined by the functions in
	# projectiles slash ClockHands.gd
	#var hand = host.objs_map[projectile]
	#hand.accelerate()
