extends CharacterState

func _frame_10():
	var position = host.get_hurtbox_center()
	var target = host.opponent.get_hurtbox_center()
	var direction = xy_to_dir(target["x"], target["y"])
	
	host.spawn_object(
		preload("res://characters/skuld/projectiles/large_clock_hand/LargeClockHand.tscn"),
		position["x"],
		position["y"] - 200,
		false,
		{"dir": direction}
	)
