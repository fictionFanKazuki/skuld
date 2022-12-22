# TODO
# - find a way to make this shit actually show on the ghost
# - make the teleport proper based on ivy's teleport code

extends CharacterState

var can_fall = false

func _enter():
	host.start_invulnerability()
	host.start_projectile_invulnerability()
	host.opponent.reset_combo()
	
	can_fall = false

func _frame_13():
	host.move_directly_absolute(
		host.last_blinked_from["x"],
		host.last_blinked_from["y"]
	)
	
	host.end_invulnerability()
	host.end_projectile_invulnerability()
	
	host.can_blink = true
	can_fall = true

func _tick():
	if can_fall:
		host.apply_grav()
		
	host.apply_forces()
