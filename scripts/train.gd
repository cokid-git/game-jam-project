extends Sprite2D

var originX = position.x

func _process(delta: float) -> void:
	position.x = originX + Global.trainMenu
