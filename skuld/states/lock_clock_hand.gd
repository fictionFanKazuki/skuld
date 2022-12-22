extends CharacterState

func _frame_1():
	var proj = host.hand_projectile
	var hand = host.objs_map[proj]
	hand.change_state("Locked")
