extends AnimatedSprite2D

@export var throwable : PackedScene
@export var sfxPlayer : AudioStreamPlayer
@export var sprite : AnimatedSprite2D

const HAMMER_TIME = 2

var elapsedTime = 0

var deltaTracker = 0

func _ready():
	
	sfxPlayer.volume_db = (0.6*Global.volumeSound) - 80
	elapsedTime = HAMMER_TIME / 2
	sprite.play("idle")
	print(sprite.animation)

func _process(delta):
	if elapsedTime <= 1:
		sprite.play("prep throw")
	else: if elapsedTime >= 1:
		sprite.play("throw")
		print(HAMMER_TIME)
	elapsedTime += delta
	if elapsedTime >= HAMMER_TIME:
		sprite.play("throw")
		throwHammer()
		sfxPlayer.play()
		elapsedTime = 0
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")

func throwHammer():
	var hammer = throwable.instantiate()
	add_child(hammer)
