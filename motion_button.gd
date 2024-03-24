extends Button

func calc_visibility(input_mode: GlobalGameState.INPUTS):
	if input_mode == GlobalGameState.INPUTS.KEYBOARD:
		return true
	elif input_mode == GlobalGameState.INPUTS.BUTTON:
		return false

func _on_game_state_manager_input_mode_mutated(input_mode):
	disabled = calc_visibility(input_mode)
