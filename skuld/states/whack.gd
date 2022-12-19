extends CharacterState

func _frame_1():
	var pos = host.get_hurtbox_center()
	var vel = host.get_vel()
	host.set_vel(vel.y, "10000")
