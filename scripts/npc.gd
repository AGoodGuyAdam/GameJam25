extends Node2D

@export var dialogues: Array[String] = []

var dialogue_idx := 0
var talking := false
@onready var dialogue_label := $Text
@onready var player := %Player
@onready var texture_button: TextureButton = $TextureButton


func _on_texture_button_pressed() -> void:
	if position.distance_to(player.position) >= 50:
		return

	if talking:
		return

	if dialogue_idx >= dialogues.size():
		dialogue_idx = 0
		dialogue_label.text = ""
		return

	dialogue_label.text = ""
	talking = true
	for ch in dialogues[dialogue_idx]:
		dialogue_label.text += ch
		await get_tree().create_timer(.1).timeout

	talking = false

	dialogue_idx += 1
