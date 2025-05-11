extends Node3D


signal on_kolya_diary_read


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var lock_interact: Area3D = %Lock/LockInteract
@onready var lock: Node3D = %Lock
@onready var ui: CanvasLayer = $UI
@onready var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D

@onready var kolya_diary: Paper = $KolyaDiary


func _ready() -> void:
	kolya_diary.process_mode = Node.PROCESS_MODE_DISABLED
	kolya_diary.on_readed.connect(func ():
		await get_tree().create_timer(10.0).timeout
		on_kolya_diary_read.emit()
		)


func _on_lock_ui_password_is_right() -> void:
	animation_player.play("open")
	lock.process_mode = Node.PROCESS_MODE_DISABLED
	ui.hide()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	collision_shape_3d.shape.size.x = 4.6
	await animation_player.animation_finished
	lock_interact.uninteract()
	
	kolya_diary.process_mode = Node.PROCESS_MODE_INHERIT
