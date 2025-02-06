extends CharacterBody2D

@onready var player: CharacterBody2D = %Player

func _physics_process(delta: float) -> void:
	var dir = global_position.direction_to(player.global_position)
	velocity = dir * 15
	move_and_slide()
