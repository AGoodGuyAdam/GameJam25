extends StaticBody2D

@onready var player = %Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if !(
		event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	):
		return

	print("clicked enemy")
