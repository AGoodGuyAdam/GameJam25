extends StaticBody2D

var MAGIC_DISTANCE := 935
@onready var sprite = $Sprite2D
@onready var player := %Player
@onready var game := $"/root/Game"


func _on_texture_button_pressed() -> void:
	if game.get_stage() != 7:
		return

	sprite.texture = preload("res://assets/stol_nopizza.png")
	game.increase_stage()
