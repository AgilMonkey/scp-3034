extends Node3D


signal radio_started
signal countdown_ended


func radio_end():
	countdown_ended.emit()


func start_radio():
	radio_started.emit()
