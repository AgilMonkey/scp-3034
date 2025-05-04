extends Control


@onready var distortion_audio: AudioStreamPlayer = $DistortionAudio
@onready var play_audio: Button = $PlayAudio


func _on_play_audio_button_down() -> void:
	if distortion_audio.playing:
		distortion_audio.stop()
		play_audio.text = "Play Audio"
	else:
		distortion_audio.play()
		play_audio.text = "Pause Audio"


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_VISIBILITY_CHANGED:
			if not is_visible_in_tree():
				distortion_audio.stop()
				play_audio.text = "Play Audio"
