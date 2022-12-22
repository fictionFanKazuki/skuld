# TODO
# - make blink not usable while blinking to avoid shenanigans
# - possibly add a counter of how many frames you have left in blink? if
#   ghost no work

extends CharacterState

# it would be good if we could get these in the sidebar somehow but i cbf
const RANGE_SCALING_FACTOR = 1.5
const BLINK_DURATION = 70

func _frame_7():
	host.move_directly(
		(data.x * RANGE_SCALING_FACTOR) as int,
		(data.y * RANGE_SCALING_FACTOR) as int
	)
	
	host.can_blink = false
	# get reference to change_state function and save position
	var change_state_reference = funcref(host, "change_state")
	host.last_blinked_from = host.get_hurtbox_center()
	
	# set callback
	host.callback_after_ticks(
		change_state_reference,
		["BlinkOut"],
		BLINK_DURATION
	)

func is_usable():
	return host.can_blink
