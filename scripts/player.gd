extends CharacterBody2D

const SPEED = 1000.0
const ACCEL = 5.0

var input := Vector2()


func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()


func _physics_process(delta: float) -> void:
	var playerInput = get_input()

	if playerInput.length() > 0:
		velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	else:
		velocity = lerp(velocity, playerInput * SPEED, delta * (ACCEL * 2))

	move_and_slide()
