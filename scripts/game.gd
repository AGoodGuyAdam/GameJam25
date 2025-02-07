extends Node2D

var stage := 0
@onready var alarm := $Alarm


func increase_stage():
	stage += 1
	if stage == 1:
		alarm.play()
	else:
		alarm.stop()


func get_stage():
	return stage


func _on_alarm_finished() -> void:
	if stage == 1:
		alarm.play()
