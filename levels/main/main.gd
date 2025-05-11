extends Node3D


@export_file("*.tscn") var credit_scene

@onready var radio: Node3D = $Radio


func _ready() -> void:
	MusicManager.muffle_ambient()
	radio.start_radio()


func start_radio():
	pass
	#radio.start_radio()


func game_over():
	MusicManager.stop_ambient()
	SceneTransition.no_fr_just_black()
	await get_tree().create_timer(3.0).timeout
	SceneTransition.just_straight_black(credit_scene)


func _on_printer_printed() -> void:
	radio.make_radio_30_s()
