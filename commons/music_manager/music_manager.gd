extends Node


@onready var ambient_audio: AudioStreamPlayer = $AmbientAudio


func _ready() -> void:
	demuffle_ambient()
	ambient_audio.play()


func play_ambient():
	demuffle_ambient()
	ambient_audio.play()


func stop_ambient():
	ambient_audio.stop()


func muffle_ambient():
	AudioServer.set_bus_effect_enabled(1, 0, true)


func demuffle_ambient():
	AudioServer.set_bus_effect_enabled(1, 0, false)
