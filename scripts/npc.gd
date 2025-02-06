extends Node2D

@export var dialogues: Array[String] = []

var dialogue_idx := 0
@onready var dialogue_label := $Text
@onready var player := %Player
@onready var texture_button: TextureButton = $TextureButton


func _on_texture_button_pressed() -> void:
	if position.distance_to(player.position) >= 50:
		return

	if dialogue_idx >= dialogues.size():
		dialogue_idx = 0
		dialogue_label.text = ""
		return
	dialogue_label.text = dialogues[dialogue_idx]
	dialogue_idx += 1
