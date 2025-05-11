extends Node3D


@onready var last_hint: Node3D = $LastHint
@onready var attention_light: MeshInstance3D = $AttentionLight
@onready var attention_audio: AudioStreamPlayer3D = $AttentionAudio

var light_on := false

var interact_count := 0


func _start_printing_last_hint():
	if interact_count > 0: return
	interact_count += 1
	last_hint.show()
	last_hint.process_mode = Node.PROCESS_MODE_INHERIT
	
	start_attention_light()
	attention_audio.play()


func stop_attention():
	light_on = false
	attention_audio.stop()


func start_attention_light():
	light_on = true
	var light_mat = attention_light.get_surface_override_material(0)
	while true:
		light_mat.emission = Color.BLACK
		attention_light.set_surface_override_material(0, light_mat)
		await get_tree().create_timer(0.5).timeout
		light_mat.emission = Color.RED
		attention_light.set_surface_override_material(0, light_mat)
		await get_tree().create_timer(0.5).timeout
		if not light_on:
			light_mat.emission = Color.BLACK
			attention_light.set_surface_override_material(0, light_mat)
			break


func _on_interactable_3d_interacted() -> void:
	DialogueManager.start_dialogue("You've done well. Finish the job", 3.0)
	await get_tree().create_timer(3.0).timeout
	stop_attention()
