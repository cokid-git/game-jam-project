extends ColorRect

func _ready():
	self_modulate.a = 0.0

func _process(delta):
	if Global.enableDarkness == true:
		if self_modulate.a <= 1.0:
			var speed := 3.0  # Try higher if nothing happens
			var target := 1.0
			var t:float = delta * speed
			self_modulate.a = lerp(self_modulate.a, target, t)


				# Debug
			#print("Alpha:", self_modulate.a)
			#self_modulate.a += 0.2 
