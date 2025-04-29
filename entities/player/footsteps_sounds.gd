extends Node3D

@export var steps_sound: Array[AudioStream]
@export var wait_time := 0.4

var is_stepping := false

@onready var player_character: PlayerCharacter = $".."
@onready var footstep_player: AudioStreamPlayer3D = $FootstepPlayer


func _physics_process(delta: float) -> void:
	if player_character.velocity.length_squared() > 1.0:
		play_footsteps()


func play_footsteps():
	if is_stepping: return
	
	is_stepping = true
	footstep_player.stream = steps_sound.pick_random()
	footstep_player.pitch_scale = randf_range(0.9, 1.2)
	footstep_player.play()
	await get_tree().create_timer(wait_time).timeout
	is_stepping = false
