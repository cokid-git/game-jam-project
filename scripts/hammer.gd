extends CharacterBody2D

@export var sfxPlayer : AudioStreamPlayer

var startVelocityX = -300
var startVelocityY = -600
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var playSound = 0

func _ready():
	sfxPlayer.volume_db = (0.55*Global.volumeSound) - 80
	position.y -= 80
	velocity.y = startVelocityY

func _process(delta):
	velocity.x = startVelocityX
	velocity.y += (1.5 * gravity) * delta
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")
	else: if playSound == 0:
		playSound = 1
		hide()
		deathSound()

func deathSound():
	sfxPlayer.play()
	await get_tree().create_timer(5).timeout
	queue_free()
	
	
