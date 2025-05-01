extends Node3D


signal countdown_ended


func radio_end():
	countdown_ended.emit()
