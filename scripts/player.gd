extends CharacterBody2D

const SPEED = 170.0
const ACCEL = 5.0

var input := Vector2()
var frozen := false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var end := $"Camera2D/end"
@onready var start := $"Camera2D/start"
@onready var steel_sound := $SteelSound
@onready var carpet_sound := $CarpetSound


func play_endgame():
	end.visible = true
	frozen = true
	end.get_node("AnimatedSprite2D").play("default")
	await end.get_node("AnimatedSprite2D").animation_finished
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func play_start_cutscene():
	start.visible = true
	frozen = true
	start.get_node("AnimatedSprite2D").play("default")
	await start.get_node("AnimatedSprite2D").animation_finished
	start.visible = false


func _ready():
	play_start_cutscene()
	frozen = false


func get_input():
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	if frozen:
		input.x = 0
		input.y = 0
	return input.normalized()


func _physics_process(delta: float) -> void:
	var player_input = get_input()

	if player_input.length() > 0:
		velocity = lerp(velocity, player_input * SPEED, delta * ACCEL)
	else:
		velocity = lerp(velocity, player_input * SPEED, delta * (ACCEL * 2))

	if player_input.x != 0:
		animated_sprite.play("walking")
		if (position.x >= 484 && position.x <= 544) && (position.y <= 61 && position.y >= 2):
			if !carpet_sound.playing:
				carpet_sound.play()
		else:
			if !steel_sound.playing:
				steel_sound.play()
		if player_input.x > 0:
			animated_sprite.flip_h = true
		elif player_input.x < 0:
			animated_sprite.flip_h = false
	elif player_input.x == 0:
		if player_input.y == 0:
			animated_sprite.play("idle")
			steel_sound.stop()
		else:
			if (position.x >= 484 && position.x <= 544) && (position.y <= 61 && position.y >= 2):
				if !carpet_sound.playing:
					carpet_sound.play()
			else:
				if !steel_sound.playing:
					steel_sound.play()
			if player_input.y < 0:
				animated_sprite.play("walking_up")
			elif player_input.y > 0:
				animated_sprite.play("walking_down")

	move_and_slide()
