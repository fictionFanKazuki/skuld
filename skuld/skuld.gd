extends Fighter

var last_blinked_from: Dictionary # position Blink was last initiated from
var hand_projectile: String

# array of active callback promises [[f, a, start_tick, duration],]
var promises: Array

func spawn_clock_hand(proj_x, proj_y, dir):
	# probably the most important bit, gives us a way of accessing the projectile later
	# spawn object i mean idk you just feed it values and it spits out an object identifier thing
	var obj = spawn_object(
		preload("res://characters/skuld/projectiles/ClockHand.tscn"),
		proj_x,
		proj_y,
		false,
		{"dir": dir}
	)
	hand_projectile = obj.obj_name
	
	# rn im returning index mentioned in clockhands.gd
	# all of this could've been done in that script i know
	# but by doing this now we can unlock the projectile afterwards as well while not in the ClockHands state
	return hand_projectile

# move directly but it actually moves directly (gotem!)
func move_directly_absolute(x: int, y: int):
	var current_pos = get_hurtbox_center()
	var current_pos_vec = Vector2(current_pos["x"], current_pos["y"])
	var target_pos_vec = Vector2(x, y)
	var relative_movement = target_pos_vec - current_pos_vec
	
	move_directly(relative_movement.x as int, relative_movement.y as int)

# execute a callback function after a given number of game ticks
func callback_after_ticks(f: FuncRef, args: Array, t: int):
	promises.append([f, args, current_tick, t])

# wrapped tick function that executes callbacks at the end
# there might be a better way of doing this that could fix the ghost but idk??
func tick():
	.tick()
	
	for i in promises.size():
		if current_tick == promises[i][2] + promises[i][3]:
			promises[i][0].call_funcv(promises[i][1])
			promises.remove(i)
