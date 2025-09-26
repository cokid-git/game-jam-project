extends Node2D


func _on_one_pressed() -> void:
	Global.level = 1
	runLevel()

func _on_two_pressed() -> void:
	Global.level = 2
	runLevel()


func runLevel():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://scenes/main_one.tscn")
	if Global.level == 2:
		get_tree().change_scene_to_file("res://scenes/main_two.tscn")
