extends Control


func _on_pressed() -> void:
	if get_tree().current_scene.name != "levelSelect":
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title.tscn")
