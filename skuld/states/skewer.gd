extends CharacterState

func _frame_10():
	var position = host.get_hurtbox_center()
	var proj_x = position["x"]
	var proj_y = position["y"] - 200
	var target = host.opponent.get_hurtbox_center()
	var direction = xy_to_dir(target["x"] - proj_x, target["y"] - proj_y)
	
	host.spawn_object(
		preload("res://characters/skuld/projectiles/large_clock_hand/LargeClockHand.tscn"),
		proj_x + data.x,
		proj_y,
		true,
		{"dir": direction}
	)
