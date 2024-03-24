extends Label

func route_input_mode(input_mode: GlobalGameState.INPUTS):
	var output
	if input_mode == GlobalGameState.INPUTS.BUTTON:
		output = "Button Mode"
	elif input_mode == GlobalGameState.INPUTS.KEYBOARD:
		output = "Keyboard Mode"
		
	return output

func _on_game_state_manager_input_mode_mutated(input_mode: GlobalGameState.INPUTS):
	text = route_input_mode(input_mode)
