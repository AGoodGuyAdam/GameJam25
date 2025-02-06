extends Node2D

@onready var dialogue_label := $Text
@export var dialogues: Array[String] = []

var dialogue_idx := 0


func _on_texture_button_pressed() -> void:
	if dialogue_idx >= dialogues.size():
		dialogue_idx = 0
		dialogue_label.text = ""
		return
	dialogue_label.text = dialogues[dialogue_idx]
	dialogue_idx += 1
