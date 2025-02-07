extends Node2D

var stage := 0
@onready var alarm := $Alarm
var map = false
@onready var player: CharacterBody2D = %Player


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("map"):
		map = !map
	player.get_node("Camera2D").get_node("Map").visible = map


func spawn_mob(magic_positioooooono: Vector2):
	var mob := preload("res://scenes/mob.tscn").instantiate()
	mob.global_position = magic_positioooooono
	add_child(mob)


func increase_stage():
	stage += 1
	print(stage)

	if stage == 4:
		spawn_mob(Vector2(129, 945))

	if stage == 9:
		# remove the mob
		for child in get_children():
			if child.name == "Doors":
				for child2 in child.get_children():
					if child2.name == "CloseDoorZone":
						for child3 in child2.get_children():
							if child3.name == "Mob":
								child3.queue_free()

	if stage == 1:
		alarm.play()
	else:
		alarm.stop()


func get_stage():
	return stage


func _on_alarm_finished() -> void:
	if stage == 1:
		alarm.play()
