extends Control

const LEVEL_SCENES := {
	1: "res://scenes/main_one.tscn",
	2: "res://scenes/main_two.tscn",
	3: "res://scenes/main_three.tscn",
	4: "res://scenes/main_four.tscn",
	5: "res://scenes/main_five.tscn",
}

func _on_level_1_pressed() -> void:
	load_level(1)

func _on_level_2_pressed() -> void:
	load_level(2)

func _on_level_3_pressed() -> void:
	load_level(3)

func _on_level_4_pressed() -> void:
	load_level(4)

func _on_level_5_pressed() -> void:
	load_level(5)

func load_level(level: int) -> void:
	Global.level = level

	var scene_path: String = LEVEL_SCENES.get(level)
	if scene_path:
		get_tree().change_scene_to_file(scene_path)
	else:
		push_error("No scene mapped for level %d" % level)
