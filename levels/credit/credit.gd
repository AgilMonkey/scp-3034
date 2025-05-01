extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	animation_player.play("start")
