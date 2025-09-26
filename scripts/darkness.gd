extends ColorRect

func _ready():
	self_modulate.a = 0.0

func _process(delta):
	if Global.enableDarkness == true:
		if self_modulate.a <= 1.0:
			self_modulate.a += 0.02
