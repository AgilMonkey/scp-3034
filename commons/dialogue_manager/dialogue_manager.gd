extends Node

@onready var dialogue_ui: CanvasLayer = $DialogueUI
@onready var dialogue_text: Label = $DialogueUI/Control/Control/VBoxContainer/DialogueContainer/MarginContainer/DialogueText
@onready var dialogue_count_text: Label = $DialogueUI/Control/Control/VBoxContainer/CountContainer/PanelContainer2/MarginContainer/DialogueCountText
@onready var dialogue_countdown_timer: Timer = $DialogueCountdownTimer
@onready var count_container: Control = $DialogueUI/Control/Control/VBoxContainer/CountContainer
@onready var dialogue_container: PanelContainer = $DialogueUI/Control/Control/VBoxContainer/DialogueContainer
@onready var dialogue_control: Control = $DialogueUI/Control

var cur_screen_timer: SceneTreeTimer = null


func start_dialogue(text: String, time: float):
	if cur_screen_timer != null:
		cur_screen_timer.disconnect("timeout", end_dialogue)
		cur_screen_timer = null
	
	dialogue_ui.show()
	dialogue_container.show()
	
	dialogue_text.text = text
	cur_screen_timer = get_tree().create_timer(time)
	cur_screen_timer.timeout.connect(end_dialogue)


func start_count_dialogue(text: String, time: float):
	dialogue_ui.show()
	count_container.show()
	dialogue_count_text.text = text
	dialogue_countdown_timer.wait_time = time
	dialogue_countdown_timer.start()


func _on_dialogue_countdown_timer_timeout() -> void:
	count_container.hide()


func end_dialogue():
	dialogue_container.hide()



func clear_dialogue():
	disable()


func put_dialogue_ui_up_a_bit():
	dialogue_control.size.y = 180


func put_dialogue_ui_normally():
	dialogue_control.size.y = get_viewport().get_visible_rect().size.y



func disable():
	if cur_screen_timer != null:
		cur_screen_timer.disconnect("timeout", end_dialogue)
		cur_screen_timer = null
	dialogue_container.hide()
