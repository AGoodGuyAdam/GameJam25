extends StaticBody2D

var pulled := false
@onready var sprite = $Sprite2D
@onready var player := %Player
@onready var game := $"/root/Game"


func _on_texture_button_pressed() -> void:
	if pulled:
		return
	pulled = true

	if position.distance_to(player.position) >= 50:
		return

	sprite.texture = preload("res://assets/placeholders/sprites/coin.png")
	game.increase_stage()
