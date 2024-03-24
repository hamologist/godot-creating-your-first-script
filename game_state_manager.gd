extends Node

signal input_mode_mutated(input: GlobalGameState.INPUTS)
signal in_motion_mutated(in_motion: bool)

func set_input_mode(input: GlobalGameState.INPUTS):
	GlobalGameState.input_mode = input
	
	if input == GlobalGameState.INPUTS.BUTTON:
		set_in_motion(false)
	elif input == GlobalGameState.INPUTS.KEYBOARD:
		set_in_motion(true)
	
	input_mode_mutated.emit(input)

func set_in_motion(input: bool):
	GlobalGameState.in_motion = input
	in_motion_mutated.emit(input)

func toggle_input_mode():
	var input_mode: GlobalGameState.INPUTS
	
	if GlobalGameState.input_mode == GlobalGameState.INPUTS.BUTTON:
		input_mode = GlobalGameState.INPUTS.KEYBOARD
	elif GlobalGameState.input_mode == GlobalGameState.INPUTS.KEYBOARD:
		input_mode = GlobalGameState.INPUTS.BUTTON
	
	set_input_mode(input_mode)

func toggle_in_motion():
	set_in_motion(!GlobalGameState.in_motion)

func _on_motion_button_pressed():
	toggle_in_motion()

func _on_input_button_pressed():
	toggle_input_mode()

func _ready():
	input_mode_mutated.emit(GlobalGameState.input_mode)
	in_motion_mutated.emit(GlobalGameState.in_motion)
