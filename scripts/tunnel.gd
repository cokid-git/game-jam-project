extends Sprite2D


func _process(delta: float) -> void:
	if Global.enableDarkness == true:
		if position.x > -1330:
			position.x -= 20
