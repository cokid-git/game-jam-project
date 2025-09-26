extends Control



func _on_button_pressed() -> void:
	if get_tree().current_scene.name != "levelSelect":
		print(get_tree().current_scene.name)
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title.tscn")
