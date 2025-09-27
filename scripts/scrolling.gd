extends Node2D

var origin = position

func _ready():
	origin = position

func _process(delta):
	position.x += -3
	if position.x <= origin.x - 594:
		print(position)
		print(origin)
		position = origin
