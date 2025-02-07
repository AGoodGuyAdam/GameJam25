extends StaticBody2D

var MAGIC_DISTANCE := 935
@export var required_stage := 0
@onready var animated_sprite = $AnimatedSprite2D
@onready var player := %Player
@onready var game := $"/root/Game"


func _on_texture_button_pressed() -> void:
	if game.get_stage() < required_stage:
		return

	print(position.distance_to(player.position))
	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	animated_sprite.play("on")
	game.increase_stage()
