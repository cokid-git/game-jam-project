extends Node2D

#@export var musicPlayer: AudioStreamPlayer
@onready var musicPlayer = $Music

var audioLocation: String #Title, Level Selection, Level, Enemy Level
var currentAudio: String #Cannot be touched externally

var level = 1

var enableDarkness = false

var volumeMusic = 50
var volumeSound = 50

func _ready() -> void:
	currentAudio = audioLocation
	
func _process(delta: float) -> void:
	if currentAudio != audioLocation:
		currentAudio = audioLocation
		updateMusic()

func updateMusic():
	print(musicPlayer)
	#musicPlayer["parameters/switch_to_clip"] = str(currentAudio)
	pass
