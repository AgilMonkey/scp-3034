extends Node


@onready var trans_ui: Control = $UI/TransUI
@onready var black: ColorRect = $UI/TransUI/Black


func no_fr_just_black():
	trans_ui.show()
	black.show()

func just_straight_black(scene_to_change):
	trans_ui.show()
	black.show()
	get_tree().change_scene_to_file(scene_to_change)
	await get_tree().process_frame
	trans_ui.hide()
	black.hide()
