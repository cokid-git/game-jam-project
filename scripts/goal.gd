extends Sprite2D

func _ready():
	pass

func _process(delta):
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		changeLevel()

func changeLevel():
	Global.level += 1
	get_tree().change_scene_to_file("res://scenes/transition.tscn")
