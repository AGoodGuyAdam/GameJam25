extends Node2D
@onready var label: Label = $Label
var text = ""
func _on_texture_button_pressed() -> void:
	label.text = text
