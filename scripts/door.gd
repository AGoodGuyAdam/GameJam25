extends StaticBody2D

var MAGIC_DISTANCE := 540
@export var required_stage := 0
@export var other_stage := 0
@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var player := %Player
@onready var game := $"/root/Game"


func close_door():
	animated_sprite.play("closed")
	collision_shape.set_deferred("disabled", false)


func _on_texture_button_pressed() -> void:
	if animated_sprite.animation != "closed":
		return

	if !(
		game.get_stage() == required_stage || (other_stage != 0 && game.get_stage() == other_stage)
	):
		return

	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	collision_shape.disabled = true
	animated_sprite.play("open")
	game.increase_stage()
