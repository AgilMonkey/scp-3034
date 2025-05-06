extends Control


var password = "1234"

@export var lock_buttons: Array[Control]

signal password_is_right

@onready var correct: ColorRect = $Correct


func _on_enter_button_button_down() -> void:
	var lock_pass = get_lock_pass()
	if lock_pass == password:
		correct.show()
		password_is_right.emit()
	else:
		print("NO!")


func get_lock_pass() -> String:
	var password = ""
	for lock in lock_buttons:
		password += str(lock.num)
	
	return password
