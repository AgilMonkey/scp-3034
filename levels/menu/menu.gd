extends Node3D


var is_playing = false

var main_scene = "res://levels/main/main.tscn"


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	MusicManager.play_ambient()
	SceneTransition.no_fr_just_black()
	await get_tree().create_timer(1.0).timeout
	SceneTransition.fade_in()


func _on_play_button_button_down() -> void:
	if is_playing: return
	is_playing = true
	SceneTransition.change_scene_fade(main_scene)


func _on_exit_button_button_down() -> void:
	get_tree().quit()
