extends Node2D

@export var musicPlayer : AudioStreamPlayer
@export var whistle : AudioStreamPlayer
#@onready var musicPlayer = $Music

var audioLocation: String #Title, Level Selection, Level, Enemy Level
var currentAudio: String #Cannot be touched externally

var level = 1

var enableDarkness = false

var volumeMusic = 100
var volumeSound = 100

var canPlayWhistle = false

func _ready() -> void:
	currentAudio = audioLocation
	
func _process(delta: float) -> void:
	musicPlayer.volume_db = (0.6*volumeMusic) - 80
	whistle.volume_db = (0.6*volumeMusic) - 80
	if currentAudio != audioLocation:
		currentAudio = audioLocation
		updateMusic()
	if audioLocation == "Title":
		canPlayWhistle = false
		#canPlayWhistle = true
	playWhistle()

func updateMusic():
	musicPlayer["parameters/switch_to_clip"] = str(currentAudio)
	
func playWhistle():
	if canPlayWhistle == true and audioLocation == "Level Selection":
		whistle.play()
		canPlayWhistle = false
