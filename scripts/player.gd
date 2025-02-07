extends CharacterBody2D

const SPEED = 170.0
const ACCEL = 5.0

var input := Vector2()

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()


func _physics_process(delta: float) -> void:
	var player_input = get_input()

	if player_input.length() > 0:
		velocity = lerp(velocity, player_input * SPEED, delta * ACCEL)
	else:
		velocity = lerp(velocity, player_input * SPEED, delta * (ACCEL * 2))
	if player_input.x != 0:
		animated_sprite.play("walking")
		if player_input.x > 0:
			animated_sprite.flip_h = true
		elif player_input.x < 0:
			animated_sprite.flip_h = false
	elif player_input.x == 0:
		if(player_input.y == 0):
			animated_sprite.play("idle")
		else:
			if player_input.y < 0:
				animated_sprite.play("walking_up")
			elif player_input.y > 0:
				animated_sprite.play("walking_down")
			
	move_and_slide()
