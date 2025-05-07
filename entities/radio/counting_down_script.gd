extends Node3D


@onready var audio_player: AnimationPlayer = $AudioPlayer


func play():
	audio_player.play("start")


func stop():
	audio_player.stop()


func _notification(what):
	if what == NOTIFICATION_WM_WINDOW_FOCUS_IN:
		if audio_player.assigned_animation != "":
			audio_player.play()
	elif what == NOTIFICATION_WM_WINDOW_FOCUS_OUT:
		audio_player.pause()
