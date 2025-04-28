extends Node3D


@onready var paper_ui: CanvasLayer = $PaperUI


func _on_interact_area_interacted() -> void:
	paper_ui.show()
