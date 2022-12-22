# TODO
# - possibly add a counter of how many frames you have left in blink? if
#   ghost no work
# - make the teleport proper based on ivy's teleport code

extends CharacterState

export var range_scaling_factor = 1.5
export var blink_duration = 80

func is_usable():
	return host.can_blink

func _frame_7():
	host.move_directly(
		(data.x * range_scaling_factor) as int,
		(data.y * range_scaling_factor) as int
	)
	
	# get reference to change_state function and save position
	var change_state_reference = funcref(host, "change_state")
	host.last_blinked_from = host.get_hurtbox_center()
	
	# set callback
	host.callback_after_ticks(
		change_state_reference,
		["BlinkOut"],
		blink_duration
	)
	
	host.can_blink = false
