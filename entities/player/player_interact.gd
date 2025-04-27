extends Node3D


@onready var interact_ray: RayCast3D = $InteractRay


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		interact()


func interact():
	var col = interact_ray.get_collider()
	if col == null: return
	if col is Interactable3D:
		col.interact()
