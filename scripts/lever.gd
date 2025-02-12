extends StaticBody2D

var MAGIC_DISTANCE := 935
@export var required_stage := 0
@onready var animated_sprite = $AnimatedSprite2D
@onready var player := %Player
@onready var game := $"/root/Game"
@onready var audio_stream_player_2d := $AudioStreamPlayer2D
@onready var first_npc := $"/root/Game/Horvi/NPC"


func _on_texture_button_pressed() -> void:
	if animated_sprite.animation != "off":
		return

	if game.get_stage() < required_stage:
		return

	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	animated_sprite.play("on")
	audio_stream_player_2d.play()
	game.increase_stage()

	if game.get_stage() == 2:
		first_npc.add_dialogues(
			[
				"I'm feeling a bit tired.",
				"Would you mind going to the storage room for me?",
				"It's down the ladder in the utility room."
			]
		)
