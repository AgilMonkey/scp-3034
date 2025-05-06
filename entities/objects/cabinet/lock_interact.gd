extends Interactable3D


@export var camera_pivot: Node3D
@export var static_body: StaticBody3D
@export var ui: CanvasLayer

var original_cam_trans


func interact():
	interacted.emit()
	disable_player()
	await lerp_camera_here()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	enable_collision(false)
	ui.show()


func enable_collision(enable: bool):
	if enable:
		static_body.process_mode = Node.PROCESS_MODE_INHERIT
		$CollisionShape3D.disabled = false
		return
	static_body.process_mode = Node.PROCESS_MODE_DISABLED
	$CollisionShape3D.disabled = true


func disable_player():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED


func enable_player():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT


func lerp_camera_here():
	var cam = get_viewport().get_camera_3d()
	original_cam_trans = cam.transform
	var tween = get_tree().create_tween().tween_property(
		cam, 
		"global_transform", 
		camera_pivot.global_transform, 
		1.0
		)
	return tween.finished


func lerp_camera_back():
	var cam = get_viewport().get_camera_3d()
	var tween = get_tree().create_tween().tween_property(
		cam, 
		"transform", 
		original_cam_trans, 
		1.0
		)
	await tween.finished


func _on_back_button_button_down() -> void:
	ui.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	enable_collision(true)
	await lerp_camera_back()
	enable_player()
