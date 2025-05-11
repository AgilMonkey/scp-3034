class_name Paper
extends Node3D


signal on_readed


@export var paper_ui: CanvasLayer
@export var exit_button: Button
@export var interact: Interactable3D


func _ready() -> void:
	interact.interacted.connect(_on_interact_area_interacted)
	exit_button.button_down.connect(_on_exit_button_button_down)
	paper_ui = paper_ui
	paper_ui.hide()
	set_process_input(false)


func _on_interact_area_interacted() -> void:
	on_readed.emit()
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	set_process_input(true)
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED
	paper_ui.show()


func _on_exit_button_button_down() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT
	paper_ui.hide()
