extends Node3D


@onready var interactable: Interactable3D = $Interactable3D
@onready var computer_ui: CanvasLayer = $ComputerUI
@onready var computer_control: Control = $ComputerUI/ComputerControl
@onready var fade: Control = $ComputerUI/Fade


func _ready() -> void:
	interactable.interacted.connect(interact)
	
	computer_ui.hide()
	computer_control.hide()
	fade.hide()


func interact():
	disable_player()
	computer_ui.show()
	await fade_in()
	computer_control.show()
	await fade_out()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func stop_interact():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	await fade_in()
	computer_control.hide()
	await fade_out()
	computer_ui.hide()
	enable_player()


func disable_player():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED


func enable_player():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT


func fade_in():
	var tween = get_tree().create_tween()
	fade.modulate = Color(0.0, 0.0, 0.0, 0.0)
	fade.show()
	tween.tween_property(fade, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)
	await tween.finished


func fade_out():
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate", Color(0.0, 0.0, 0.0, 0.0), 0.5)
	await tween.finished
	fade.hide()


func _on_back_button_button_down() -> void:
	stop_interact()
