extends CharacterBody2D

var MAGIC_DISTANCE := 18
@onready var player: CharacterBody2D = $"/root/Game/Player"


func _process(_delta: float) -> void:
	if global_position.distance_to(player.global_position) < MAGIC_DISTANCE:
		get_tree().reload_current_scene()


func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(player.global_position)
	velocity = dir * 15
	move_and_slide()
