extends Node3D


@onready var last_hint: Node3D = $LastHint


func _start_printing_last_hint():
	last_hint.show()
	last_hint.process_mode = Node.PROCESS_MODE_INHERIT


func _on_interactable_3d_interacted() -> void:
	DialogueManager.start_dialogue("You've done well. Finish the job", 3.0)
