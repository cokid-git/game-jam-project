extends Control


func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	


func _on_settings_btn_pressed() -> void:
	print("TODO THIS")




func _on_quit_btn_pressed() -> void:
	get_tree().quit()
