extends Node3D

@export_multiline var text = "DO NOT LET HER FINISH\nTELL HER ALL IS WELL"

func _on_interact_speak_interacted() -> void:
	DialogueManager.start_dialogue(text, 4.0)
