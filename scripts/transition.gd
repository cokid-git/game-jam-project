extends Node2D

func _ready():
	#get_tree().create_timer(1).timeout.connect(startNextLevel)
	startNextLevel()

func startNextLevel():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://scenes/main_one.tscn")
	if Global.level == 2:
		get_tree().change_scene_to_file("res://scenes/main_two.tscn")
	if Global.level == 3:
		get_tree().change_scene_to_file("res://scenes/main_three.tscn")
	if Global.level == 4:
		get_tree().change_scene_to_file("res://scenes/main_four.tscn")
	if Global.level == 5:
		get_tree().change_scene_to_file("res://scenes/main_five.tscn")
	if Global.level >= 6:
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
