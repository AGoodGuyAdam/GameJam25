extends StaticBody2D

@export var required_stage := 0

@onready var collision_shape = $CollisionShape2D
@onready var sprite = $Sprite2D
@onready var player := %Player
@onready var game := $"/root/Game"


func _on_texture_button_pressed() -> void:
	if game.get_stage() != required_stage:
		return

	if position.distance_to(player.position) >= 50:
		return

	collision_shape.disabled = true
	sprite.texture = preload("res://assets/placeholders/sprites/coin.png")
	game.increase_stage()
