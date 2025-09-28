extends Control

@export var musicSlider : HSlider
@export var soundSlider : HSlider

func _ready() -> void:
	musicSlider.value = Global.volumeMusic
	soundSlider.value = Global.volumeSound
	
func _process(delta: float) -> void:
	Global.volumeMusic = musicSlider.value
	Global.volumeSound = soundSlider.value
