extends Node3D


signal interacted_with


@onready var paper_ui: CanvasLayer = $PaperUI
@onready var paper_sound: AudioStreamPlayer = $PaperSound


func _on_interact_area_interacted() -> void:
	paper_sound.play()
	interacted_with.emit()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED
	paper_ui.show()


func _on_exit_button_button_down() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT
	paper_ui.hide()
