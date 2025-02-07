extends Area2D

var already_closed := false
@onready var door1 := $"/root/Game/Doors/Door"
@onready var door2 := $"/root/Game/Doors/Door3"
@onready var door3 := $"/root/Game/Doors/Door4"
@onready var game := $"/root/Game"


func _on_body_entered(body: Node2D) -> void:
	if game.get_stage() != 8:
		return

	if body.name != "Player" or already_closed:
		return

	already_closed = true
	door1.close_door()
	door2.close_door()
	door3.close_door()
	var mob := preload("res://scenes/mob.tscn").instantiate()
	mob.global_position = Vector2(-100, 20)
	add_child(mob)
