extends CharacterBody2D

var startVelocityX = -300
var startVelocityY = -600
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	position.y -= 80
	velocity.y = startVelocityY

func _process(delta):
	velocity.x = startVelocityX
	velocity.y += (1.5 * gravity) * delta
	
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")
	else:
		queue_free()
