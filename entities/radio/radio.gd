extends Node3D


signal radio_started
signal countdown_ended

@onready var radio_timer: Node3D = $RadioTimer


func make_radio_30_s():
	radio_timer.min_start_rand_timer = 30.0
	radio_timer.max_start_rand_timer = 30.0
	radio_timer.start_radio_random_timer()


func radio_end():
	countdown_ended.emit()


func start_radio():
	radio_started.emit()
