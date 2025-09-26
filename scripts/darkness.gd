extends ColorRect

func _ready():
	self_modulate.a = 0.0

func _process(delta):
	if Global.enableDarkness == true:
		self_modulate.a = 1.0
