extends Area2D

var already_closed := false
@onready var player := $"/root/Game/Player"
@onready var game := $"/root/Game"


func _on_body_entered(body: Node2D) -> void:
	if game.get_stage() != 10:
		return

	if body.name != "Player" or already_closed:
		return

	already_closed = true
	player.play_endgame()
