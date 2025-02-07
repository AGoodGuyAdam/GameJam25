extends AudioStreamPlayer2D

@onready var start := $"/root/Game/Player/Camera2D/start"


func _process(_delta: float) -> void:
	if start.visible:
		await get_tree().create_timer(1.5).timeout
		if !playing:
			play()
		await get_tree().create_timer(3.625).timeout
		if playing:
			stop()
