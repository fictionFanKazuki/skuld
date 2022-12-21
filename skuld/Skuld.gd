extends Fighter

var hands_projectile

func spawn_clock_hands(proj_x, proj_y, dir):
	# probably the most important bit, gives us a way of accessing the projectile later
	# spawn object i mean idk you just feed it values and it spits out an object identifier thing
	var obj = spawn_object(preload("res://characters/skuld/projectiles/ClockHands.tscn"), proj_x, proj_y, false, {"dir":dir})
	hands_projectile = obj.obj_name
	# rn im returning index mentioned in clockhands.gd
	# all of this could've been done in that script i know
	# but by doing this now we can unlock the projectile afterwards as well while not in the ClockHands state
	return hands_projectile
