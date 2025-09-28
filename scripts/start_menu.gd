extends Control

## Load the settings scene once
var settings_scene = preload("res://scenes/settings_panel.tscn") # Update path if different
var settings_instance = null



func _ready() -> void:
	Global.audioLocation = "Title"


func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	


func _on_settings_btn_pressed() -> void:
	$Panel_Main.visible = false
	if settings_instance == null:
		settings_instance = settings_scene.instantiate()
		$SettingsContainer.add_child(settings_instance)
		settings_instance.get_node("Panel_Main/VBoxContainer/Back_btn").pressed.connect(_on_back_pressed)
	else:
		settings_instance.visible = true


func _on_back_pressed():
	settings_instance.visible = false
	$Panel_Main.visible = true



func _on_quit_btn_pressed() -> void:
	get_tree().quit()
