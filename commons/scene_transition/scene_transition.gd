extends Node


var cur_tween1: Tween
var cur_tween2: Tween
var tween_fade: Tween

@onready var trans_ui: Control = $UI/TransUI
@onready var black: ColorRect = $UI/TransUI/Black


func no_fr_just_black():
	black.color = Color.BLACK
	trans_ui.show()
	black.show()


func fade_in():
	black.color = Color.BLACK
	trans_ui.show()
	black.show()
	
	tween_fade = get_tree().create_tween()
	tween_fade.tween_property(black, "color", Color(0, 0, 0, 0), 1.0)
	await tween_fade.finished
	trans_ui.hide()
	black.hide()


func change_scene_fade(scene: String):
	if tween_fade: tween_fade.stop()
	
	trans_ui.show()
	black.show()
	cur_tween1 = get_tree().create_tween()
	cur_tween1.tween_property(black, "color", Color.BLACK, 1.0)
	await cur_tween1.finished
	get_tree().change_scene_to_file(scene)
	await get_tree().create_timer(1.0).timeout
	
	var cur_tween2 = get_tree().create_tween()
	cur_tween2.tween_property(black, "color", Color(0, 0, 0, 0), 1.0)
	await cur_tween2.finished
	trans_ui.hide()
	black.hide()


func just_straight_black(scene_to_change):
	black.color = Color.BLACK
	trans_ui.show()
	black.show()
	get_tree().change_scene_to_file(scene_to_change)
	await get_tree().process_frame
	trans_ui.hide()
	black.hide()
