extends StaticBody2D

var MAGIC_DISTANCE := 730
@export var to_position := Vector2.ZERO
@export var required_stage := 0
@onready var sprite = $Sprite2D
@onready var player := %Player
@onready var game := $"/root/Game"
@onready var audio_stream_player_2d := $AudioStreamPlayer2D


func _on_texture_button_pressed() -> void:
	if game.get_stage() < required_stage:
		return

	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	player.position = to_position
	audio_stream_player_2d.play()
	for child in game.get_children():
		if child.name == "Mob":
			child.queue_free()
