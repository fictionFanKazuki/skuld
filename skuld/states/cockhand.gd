extends CharacterState


const PROJECTILE_X = 10
const PROJECTILE_Y = - 16

func _frame_0():
	var dir = host.obj_local_center(host.opponent)
	dir = fixed.normalized_vec(str(dir.x), str(dir.y))
	var obj = host.spawn_object(preload("res://characters/skuld/projectiles/CockHand.tscn"), PROJECTILE_X, PROJECTILE_Y, true, {"dir":dir})

