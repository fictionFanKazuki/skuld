extends BaseProjectile

func lock():
	# my desperate attempts
	reset_momentum()
	set_vel(str(0), str(0))
	limit_speed(str(0))
