extends Control

const LEVEL_SCENES := {
	1: "res://scenes/main_one.tscn",
	2: "res://scenes/main_two.tscn",
}

func _on_level_1_pressed() -> void:
	print("Level 1")
	load_level(1)

func _on_level_2_pressed() -> void:
	print("Level 2")
	load_level(2)

func _on_level_3_pressed() -> void:
	print("Level 3 (not implemented yet)")

func _on_level_4_pressed() -> void:
	print("Level 4 (not implemented yet)")

func _on_level_5_pressed() -> void:
	print("Level 5 (not implemented yet)")

func load_level(level: int) -> void:
	Global.level = level

	var scene_path: String = LEVEL_SCENES.get(level)
	if scene_path:
		get_tree().change_scene_to_file(scene_path)
	else:
		push_error("No scene mapped for level %d" % level)
