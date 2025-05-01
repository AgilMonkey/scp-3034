extends Node3D


@onready var audio_player: AnimationPlayer = $AudioPlayer


func play():
	audio_player.play("start")


func stop():
	audio_player.stop()
