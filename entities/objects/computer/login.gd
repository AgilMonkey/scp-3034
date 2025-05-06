extends Control


signal login_successful

@export var password: String = "19640202"

@onready var line_edit: LineEdit = $LineEdit
@onready var wrong_text: Label = $LineEdit/WrongText
@onready var wrong_text_timer: Timer = $LineEdit/WrongText/WrongTextTimer


func _on_enter_button_button_down() -> void:
	var line_text = line_edit.text
	if line_text == password:
		login_successful.emit()
	else:
		wrong_text_timer.wait_time = 3.0
		wrong_text_timer.start()
		wrong_text.show()
		wrong_text_timer.timeout.connect(func(): wrong_text.hide())
