class_name Game extends Node

@onready var timer: Timer = $Timer
@onready var hand: Limb = $Hand
@onready var camera: Camera2D = $Camera2D
@onready var level_fade: Fade = $LevelFade

@export var levels: Array[Level]
var current_level: Level
var next_level = 0

var coffee_spilled: bool = false
var nutella_spilled: bool = false
var mayo_spilled:bool = false
var blood_spilled:bool = false

func _ready() -> void:
	start_game()

func start_game() -> void:
	#start timer
	get_tree().create_tween().tween_callback(timer.start).set_delay(1)

	timer.start()
	$Level1/Zipper.freeze()
	
	#for level: Level in levels:
	#	remove_child(level)
	
	#load level
	load_next_level()

func exit_level() -> void:
	if next_level > levels.size() -1:
		won_game()
	else:
		load_next_level()

func load_next_level() -> void:
	#if current_level:
		# disable old level
		#current_level.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	
	#enable new Level scene
	current_level = levels[next_level]
	
	#add_child(current_level)
	
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD).set_parallel(true)
	#move cam
	tween.tween_property(camera, "position", current_level.camera_pos.global_position, 1)
	#move hand
	tween.tween_property(hand, "position", current_level.hand_start_pos.global_position, 1)
	tween.tween_property(hand, "rotation", 0, 1)
	
	tween.tween_property(current_level.ceiling, "process_mode", Node.PROCESS_MODE_INHERIT, 1)
	
	
	next_level += 1

func time_out() -> void:
	level_fade.fade_black_and_call(load_game_over_scene)

func load_game_over_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/EndGameScreen/game_over.tscn")

func won_game() -> void:
	var won_scene = preload("res://scenes/EndGameScreen/game_completed.tscn").instantiate()
	get_tree().root.add_child(won_scene)
	won_scene.set_stain(blood_spilled, mayo_spilled, coffee_spilled)
	
	queue_free()
	print("won game")

func set_coffee_spilled() -> void:
	coffee_spilled = true

func set_nutella_spilled() -> void:
	nutella_spilled = true
	
func set_mayo_spilled() -> void:
	mayo_spilled = true
	
func set_blood_spilled() -> void:
	blood_spilled = true


func _on_skateboard_detector_body_entered(body):
	if body.name == "Board":
		print("Unfrozen")
		$Level1/Zipper.unfreeze()
