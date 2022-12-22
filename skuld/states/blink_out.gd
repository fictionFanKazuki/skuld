# TODO
# - find a way to make this shit actually show on the ghost
# - add invulnerability to make it useful for escaping combos

extends CharacterState

func _frame_13():
	host.move_directly_absolute(
		host.last_blinked_from["x"],
		host.last_blinked_from["y"]
	)
	host.can_blink = true
