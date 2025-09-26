extends Node2D

func _ready():
	get_tree().create_timer(1).timeout.connect(startNextLevel)

func startNextLevel():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://scenes/main_one.tscn")
	if Global.level == 2:
		get_tree().change_scene_to_file("res://scenes/main_two.tscn")
