#extends Node2D
#
## Mapping level numbers to scene paths
#const LEVEL_SCENES := {
	#1: "res://scenes/main_one.tscn",
	#2: "res://scenes/main_two.tscn",
#}
#
#func _on_one_pressed() -> void:
	#load_level(1)
#
#func _on_two_pressed() -> void:
	#load_level(2)
#
#func load_level(level: int) -> void:
	#Global.level = level
#
	#var scene_path:String= LEVEL_SCENES.get(level)
	#if scene_path:
		#get_tree().change_scene_to_file(scene_path)
	#else:
		#push_error("No scene mapped for level %d" % level)
		
extends Control
