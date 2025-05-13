extends Control


var num: int = 0

@onready var lock_num: Label = $PanelContainer/LockNum
@onready var press_sound: AudioStreamPlayer = $PressSound


func _on_up_button_button_down() -> void:
	num += 1
	if num > 9:
		num = 0
	lock_num.text = str(num)
	
	press_sound.play()


func _on_down_button_button_down() -> void:
	num -= 1
	if num < 0:
		num = 9
	lock_num.text = str(num)
	
	press_sound.play()
