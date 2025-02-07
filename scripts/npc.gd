extends Node2D

var MAGIC_DISTANCE := 954
@export var magic_sprite_number := 0
@export var dialogues: Array[String] = []

var dialogue_idx := 0
var talking := false
var already_talked := false
@onready var dialogue_label := $Text
@onready var player := %Player
@onready var texture_button: TextureButton = $TextureButton
@onready var game := $"/root/Game"
@onready var animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	if magic_sprite_number == 0:
		animated_sprite.play("1")
	elif magic_sprite_number == 1:
		animated_sprite.play("2")


func _on_texture_button_pressed() -> void:
	if position.distance_to(player.position) >= MAGIC_DISTANCE + 50:
		return

	if talking:
		return

	if dialogue_idx >= dialogues.size():
		dialogue_idx = 0
		dialogue_label.text = ""
		if not already_talked:
			game.increase_stage()
		already_talked = true
		return

	dialogue_label.text = ""
	talking = true
	for ch in dialogues[dialogue_idx]:
		dialogue_label.text += ch
		await get_tree().create_timer(.1).timeout

	talking = false

	dialogue_idx += 1
