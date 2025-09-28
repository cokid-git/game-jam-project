extends CharacterBody2D

@export var sfxPlayer : AudioStreamPlayer
@export var sfxJump : AudioStreamPlayer
@export var sprite : AnimatedSprite2D

const SPEED = 200.0
const JUMP_FORCE = -500.0

const COYOTE_TIME = 0.1
var coyote = false

const BUFFER_TIME = 0.2
var buffer = false

const START_TIME = 0.5
var startMove = false

var jumpAvailable = false

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var canWalk = false

func _ready():
	sfxPlayer.volume_db = (0.5*Global.volumeSound) - 80
	sfxJump.volume_db = (0.5*Global.volumeSound) - 80
	get_tree().create_timer(START_TIME).timeout.connect(enableMovement)
	sfxPlayer["parameters/switch_to_clip"] = str("Walk")
	sfxPlayer.play()
	playWalkSound()

func _physics_process(delta):	# Add the gravity.
	if startMove == true:
		# Add the gravity.
		if not is_on_floor():
			jumpAvailable = false
			if coyote == true:
				get_tree().create_timer(COYOTE_TIME).timeout.connect(coyoteTimeOut)
			velocity.y += gravity * delta
		else:
			jumpAvailable = true
			coyote = true
			if buffer == true:
				velocity.y = JUMP_FORCE
				sfxJump.play()
				buffer = false
		

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept"):
			darknessToggle()
			if jumpAvailable == true:
				coyote = false
				velocity.y = JUMP_FORCE
				sfxJump.play()
			else: if jumpAvailable == false:
				if coyote == true:
					coyote = false
					velocity.y = JUMP_FORCE
					sfxJump.play()
				else: if coyote == false:
					buffer = true
					get_tree().create_timer(BUFFER_TIME).timeout.connect(bufferTimeOut)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			if is_on_floor():
				canWalk = true
			if not is_on_floor():
				canWalk = false
			darknessToggle()
			velocity.x = direction * SPEED
			if Input.is_action_just_pressed("ui_left"):
				sprite.flip_h = true
			if Input.is_action_just_pressed("ui_right"):
				sprite.flip_h = false
		else:
			canWalk = false
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if direction and is_on_floor():
			sprite.play("walk")
		else: if is_on_floor():
			sprite.play("idle")
		else: if not is_on_floor():
			sprite.play("jump")

		playWalkSound()
		move_and_slide()

func coyoteTimeOut():
	coyote = false

func bufferTimeOut():
	buffer = false
	
func darknessToggle():
	Global.enableDarkness = true

func enableMovement():
	startMove = true

func playWalkSound():
	if canWalk == true:
		sfxPlayer.volume_db = -30.0
	if canWalk == false:
		sfxPlayer.volume_db = -80.0
