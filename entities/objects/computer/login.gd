extends Control


@export var password: String = "143254"

@onready var line_edit: LineEdit = $LineEdit
@onready var wrong_text: Label = $LineEdit/WrongText
@onready var wrong_text_timer: Timer = $LineEdit/WrongText/WrongTextTimer


func _on_enter_button_button_down() -> void:
	var line_text = line_edit.text
	if line_text == password:
		print("CORRECT")
	else:
		wrong_text_timer.wait_time = 3.0
		wrong_text_timer.start()
		wrong_text.show()
		wrong_text_timer.timeout.connect(func(): wrong_text.hide())
