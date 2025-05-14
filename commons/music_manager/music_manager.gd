extends Node


@onready var ambient_audio: AudioStreamPlayer = $AmbientAudio
@onready var ambient_muffled_audio: AudioStreamPlayer = $AmbientMuffledAudio


func play_ambient():
	demuffle_ambient()
	ambient_audio.play()
	ambient_muffled_audio.play()


func stop_ambient():
	ambient_audio.stop()
	ambient_muffled_audio.stop()


func muffle_ambient():
	var tween = create_tween()
	tween.tween_property(ambient_audio, "volume_db", -30, 1.0)
	tween.tween_property(ambient_muffled_audio, "volume_db", 0, 1.0)


func demuffle_ambient():
	var tween = create_tween()
	tween.tween_property(ambient_audio, "volume_db", 0, 1.0)
	tween.tween_property(ambient_muffled_audio, "volume_db", -30, 1.0)
