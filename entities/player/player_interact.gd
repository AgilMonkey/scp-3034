extends Node3D


@export var normal_crosshair_img: CompressedTexture2D
@export var interact_crosshair_img: CompressedTexture2D


@onready var interact_ray: RayCast3D = $InteractRay
@onready var crosshair: TextureRect = $"../../../PlayerHUD/Control/Crosshair"


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		interact()


func _process(delta: float) -> void:
	var col = interact_ray.get_collider()
	if col == null:
		crosshair.texture = normal_crosshair_img
	else:
		crosshair.texture = interact_crosshair_img

func interact():
	var col = interact_ray.get_collider()
	if col == null: return
	if col is Interactable3D:
		col.interact()
