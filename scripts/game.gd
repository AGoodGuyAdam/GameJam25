extends Node2D

var stage := 0


func _process(_delta: float) -> void:
	print(stage)


func increase_stage():
	stage += 1


func get_stage():
	return stage
