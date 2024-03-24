extends Sprite2D

var speed = 400
var angular_speed = PI
var current_input_process = keyboard_process

func button_process(delta: float):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func keyboard_process(delta: float):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	
	rotation += angular_speed * direction * delta
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta

func route_process(input_mode: GlobalGameState.INPUTS):
	var input_process
	if GlobalGameState.input_mode == GlobalGameState.INPUTS.BUTTON:
		input_process = button_process
	elif GlobalGameState.input_mode == GlobalGameState.INPUTS.KEYBOARD:
		input_process = keyboard_process
	
	return input_process

func _on_game_state_manager_in_motion_mutated(in_motion: bool):
	set_process(in_motion)

func _on_game_state_manager_input_mode_mutated(input_mode: GlobalGameState.INPUTS):
	current_input_process = route_process(input_mode)

func _process(delta):
	current_input_process.call(delta)

func _on_timer_timeout():
	visible = not visible

func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
