extends StaticBody2D

var MAGIC_DISTANCE := 540
@export var required_stage := 0
@export var other_stage := 0
@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var player := %Player
@onready var game := $"/root/Game"
@onready var open_sound := $OpenSound
@onready var close_sound := $CloseSound


func close_door():
	animated_sprite.play("closed")
	collision_shape.set_deferred("disabled", false)
	close_sound.play()


func _on_texture_button_pressed() -> void:
	if animated_sprite.animation != "closed":
		return

	if !(
		game.get_stage() == required_stage || (other_stage != 0 && game.get_stage() == other_stage)
	):
		return

	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	animated_sprite.play("open")
	open_sound.play()
	await animated_sprite.animation_finished
	collision_shape.disabled = true
	game.increase_stage()
