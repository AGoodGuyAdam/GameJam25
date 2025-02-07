extends Node2D

var stage := 0
@onready var alarm := $Alarm


func spawn_mob(magic_positioooooono: Vector2):
	var mob := preload("res://scenes/mob.tscn").instantiate()
	mob.global_position = magic_positioooooono
	add_child(mob)


func increase_stage():
	stage += 1
	print(stage)

	if stage == 4:
		spawn_mob(Vector2(129, 945))

	if stage == 1:
		alarm.play()
	else:
		alarm.stop()


func get_stage():
	return stage


func _on_alarm_finished() -> void:
	if stage == 1:
		alarm.play()
