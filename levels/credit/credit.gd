extends Node2D


@onready var fade_animation: AnimationPlayer = $FadeAnimation
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const MENU = "res://levels/menu/menu.tscn"
var menu_change := false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	animation_player.play("start")


func _on_back_button_button_down() -> void:
	if menu_change: return
	menu_change = true
	fade_animation.play("fade_out")
	await fade_animation.animation_finished
	SceneTransition.change_scene_fade(MENU)
