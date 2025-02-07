extends CharacterBody2D

var MAGIC_DISTANCE := 18
@onready var player: CharacterBody2D = $"/root/Game/Player"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	audio_stream_player_2d.play()


func _process(_delta: float) -> void:
	if global_position.distance_to(player.global_position) < MAGIC_DISTANCE:
		get_tree().reload_current_scene()


func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(player.global_position)
	velocity = dir * 25
	if dir.x > 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	move_and_slide()


func _on_audio_stream_player_2d_finished() -> void:
	audio_stream_player_2d.play()
