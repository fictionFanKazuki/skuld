extends BaseProjectile

func lock():
	# my desperate attempts
	reset_momentum()
	set_vel(str(0), str(0))
	limit_speed(str(0))

func accelerate():
	set_vel(15, 15)
