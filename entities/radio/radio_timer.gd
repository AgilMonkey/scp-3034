extends Node3D


var max_countdown_timer = 50.0

var min_start_rand_timer = 120.0
var max_start_rand_timer = 180.0

var countdown_t


@onready var start_radio_audio: AudioStreamPlayer3D = $StartRadio
@onready var countdown_timer: Timer = $CountdownTimer
@onready var radio_timer: Timer = $RadioTimer
@onready var all_is_well_button: Button = $"../RadioUI/Control/AllIsWellButton"
@onready var counting_down_script: Node3D = $"../CountingDownScript"
@onready var counting_down_audio: AudioStreamPlayer3D = $"../CountingDownScript/CountingDownAudio"


func _process(delta: float) -> void:
	if not countdown_timer.is_stopped():
		print(ceil(countdown_timer.time_left))


func start_radio_beginning():
	var beginning_time := 60.0
	radio_timer.start(beginning_time)
	await radio_timer.timeout
	start_radio()


func start_radio_random_timer():
	var rand_time = randf_range(min_start_rand_timer, max_start_rand_timer)
	radio_timer.start(rand_time)
	await radio_timer.timeout
	start_radio()


func start_radio():
	var is_any_radio_audio_playing = (
		start_radio_audio.playing or 
		counting_down_audio.playing)
	if is_any_radio_audio_playing :
		return
	
	start_radio_audio.play()
	await start_radio_audio.finished
	countdown()


func countdown():
	all_is_well_button.show()
	counting_down_script.play()


func _on_all_is_well_button_button_down() -> void:
	all_is_well_button.hide()
	counting_down_script.stop()
	DialogueManager.start_dialogue("All is well", 3.0)
	await get_tree().create_timer(3.0).timeout
	start_radio_random_timer()
