extends Node3D


@export_file("*.tscn") var credit_scene


func game_over():
	SceneTransition.no_fr_just_black()
	await get_tree().create_timer(3.0).timeout
	SceneTransition.just_straight_black(credit_scene)
