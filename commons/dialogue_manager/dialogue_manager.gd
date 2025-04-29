extends Node

@onready var dialogue_ui: CanvasLayer = $DialogueUI
@onready var dialogue_text: Label = $DialogueUI/Control/PanelContainer/MarginContainer/DialogueText

var cur_screen_timer: SceneTreeTimer = null


func start_dialogue(text: String, time: float):
	if cur_screen_timer != null:
		cur_screen_timer.disconnect("timeout", end_dialogue)
		cur_screen_timer = null
	
	dialogue_ui.show()
	dialogue_text.text = text
	cur_screen_timer = get_tree().create_timer(time)
	cur_screen_timer.timeout.connect(end_dialogue)


func end_dialogue():
	dialogue_ui.hide()


func clear_dialogue():
	disable()


func disable():
	if cur_screen_timer != null:
		cur_screen_timer.disconnect("timeout", end_dialogue)
		cur_screen_timer = null
	dialogue_ui.hide()
