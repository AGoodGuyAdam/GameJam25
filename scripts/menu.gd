extends Control


func _on_play_pressed() -> void:
	#change scene to game
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_credits_pressed() -> void:
	#change scene to credits
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_quit_pressed() -> void:
	#quit the game
	get_tree().quit()


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://controls.tscn")
