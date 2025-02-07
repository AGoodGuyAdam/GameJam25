extends AudioStreamPlayer2D

@onready var end := $"/root/Game/Player/Camera2D/end"


func _process(_delta: float) -> void:
	if end.visible:
		await get_tree().create_timer(3.5).timeout
		if !playing:
			play()
