extends CharacterBody2D

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

func _ready():
	get_tree().create_timer(START_TIME).timeout.connect(enableMovement)

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
				buffer = false
		

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept"):
			darknessToggle()
			if jumpAvailable == true:
				coyote = false
				velocity.y = JUMP_FORCE
			else: if jumpAvailable == false:
				if coyote == true:
					coyote = false
					velocity.y = JUMP_FORCE
				else: if coyote == false:
					buffer = true
					get_tree().create_timer(BUFFER_TIME).timeout.connect(bufferTimeOut)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			darknessToggle()
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()

func coyoteTimeOut():
	coyote = false

func bufferTimeOut():
	buffer = false
	
func darknessToggle():
	Global.enableDarkness = true

func enableMovement():
	startMove = true
