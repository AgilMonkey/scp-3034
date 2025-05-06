extends Node3D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var lock_interact: Area3D = %Lock/LockInteract
@onready var lock: Node3D = %Lock
@onready var ui: CanvasLayer = $UI
@onready var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D


func _on_lock_ui_password_is_right() -> void:
	animation_player.play("open")
	lock.process_mode = Node.PROCESS_MODE_DISABLED
	ui.hide()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	collision_shape_3d.shape.size.x = 4.6
	await animation_player.animation_finished
	lock_interact.uninteract()
