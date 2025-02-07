extends AudioStreamPlayer2D


func _ready() -> void:
	await get_tree().create_timer(3.5).timeout
	play()
