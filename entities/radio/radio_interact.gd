extends Interactable3D


var original_cam_trans

@onready var cam_pivot: Node3D = $"../CamPivot"
@onready var radio_ui: CanvasLayer = $"../RadioUI"


func _ready() -> void:
	set_process_input(false)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		stop_interacting()


func interact():
	disable_player()
	await lerp_camera_here()
	set_process_input(true)
	show_ui()


func stop_interacting():
	DialogueManager.put_dialogue_ui_normally()
	set_process_input(false)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	radio_ui.hide()
	
	var cam = get_viewport().get_camera_3d()
	var tween = get_tree().create_tween().tween_property(
		cam, 
		"transform", 
		original_cam_trans, 
		1.0
		)
	await tween.finished
	
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT


func disable_player():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED


func lerp_camera_here():
	var cam = get_viewport().get_camera_3d()
	original_cam_trans = cam.transform
	var tween = get_tree().create_tween().tween_property(
		cam, 
		"global_transform", 
		cam_pivot.global_transform, 
		1.0
		)
	return tween.finished


func show_ui():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	radio_ui.show()


func _on_back_button_button_down() -> void:
	stop_interacting()


func _on_all_is_well_button_draw() -> void:
	DialogueManager.put_dialogue_ui_up_a_bit()


func _on_all_is_well_button_hidden() -> void:
	DialogueManager.put_dialogue_ui_normally()
