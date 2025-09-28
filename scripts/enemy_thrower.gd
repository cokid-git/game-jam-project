extends AnimatedSprite2D

@export var throwable : PackedScene
@export var sfxPlayer : AudioStreamPlayer

const HAMMER_TIME = 2

var elapsedTime = 0

var deltaTracker = 0

func _ready():
	
	sfxPlayer.volume_db = (0.6*Global.volumeSound) - 80
	elapsedTime = HAMMER_TIME / 2
	play("idle")

func _process(delta):
	if delta >= HAMMER_TIME * 1 / 3:
		play("throw")
	else: if delta >= HAMMER_TIME * 2/ 3:
		play("idle")
	else: if delta >= HAMMER_TIME:
		play("prep throw")
	elapsedTime += delta
	if elapsedTime >= HAMMER_TIME:
		play("throw")
		throwHammer()
		sfxPlayer.play()
		elapsedTime = 0
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")

func throwHammer():
	var hammer = throwable.instantiate()
	add_child(hammer)
