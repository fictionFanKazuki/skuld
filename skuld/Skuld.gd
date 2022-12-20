extends Fighter

const NEEDLE_SCENE = preload("res://characters/skuld/projectiles/needles/Needles.tscn")
var needle_projectile 

func spawn_needles():
	var needle = spawn_object(NEEDLE_SCENE, -10, -56)
	needle_projectile = needle.obj_name
