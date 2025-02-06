extends StaticBody2D

@onready var collision_shape = $CollisionShape2D
@onready var sprite = $Sprite2D
@onready var player := %Player


func _on_texture_button_pressed() -> void:
	if position.distance_to(player.position) >= 50:
		return

	collision_shape.disabled = true
	sprite.texture = preload("res://assets/placeholders/sprites/coin.png")
