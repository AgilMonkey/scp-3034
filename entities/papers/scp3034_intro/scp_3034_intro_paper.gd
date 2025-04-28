extends Node3D


@onready var paper_ui: CanvasLayer = $PaperUI


func _on_interact_area_interacted() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED
	paper_ui.show()


func _on_exit_button_button_down() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT
	paper_ui.hide()
