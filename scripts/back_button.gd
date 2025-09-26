extends Control

func _on_pressed() -> void:
	var scene_name = get_tree().current_scene.name
	
	# Ensure the current scene is properly loaded before attempting to switch
	if scene_name == "":
		print("Warning: Current scene is not properly initialized.")
		return

	# Define the target scene based on the current scene name
	var target_scene = ""
	
	if scene_name == "levelSelect":
		target_scene = "res://scenes/start_menu.tscn"
	elif scene_name == "start_menu":
		target_scene = "res://scenes/level_select.tscn"
	else:
		print("Warning: Unknown current scene name: %s. No scene transition performed." % scene_name)
		return


	
	# Check if the scene is already loaded in memory
	var scene = ResourceLoader.load(target_scene)
	if scene == null:
		print("Error: Failed to load scene '%s'." % target_scene)
		return

	# Change the scene if all checks pass
	print("Changing scene to: %s" % target_scene)
	get_tree().change_scene_to_file(target_scene)
