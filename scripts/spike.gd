extends Sprite2D

func _ready():
	pass

func _process(delta):
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")
