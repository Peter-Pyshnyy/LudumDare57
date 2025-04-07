class_name Game extends Node

@onready var timer: Timer = $Timer
@onready var hand: Limb = $Hand
@onready var camera: Camera2D = $Camera2D
@onready var level_fade: Fade = $LevelFade
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

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
	$Level0/Zipper.freeze()
	$Level1/Zipper.freeze()
	$Level2/Zipper.freeze()
	
	#for level: Level in levels:
	#	remove_child(level)
	
	#load level
	load_next_level()
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:  # Check if the event is a keyboard event
		if event.pressed and event.keycode == KEY_R:  # Check if "R" is pressed
			get_tree().reload_current_scene()

func exit_level() -> void:
	if next_level > levels.size() -1:
		won_game()
	else:
		load_next_level()

func load_next_level() -> void:

	
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
	
	if next_level == 1:
		timer.start()
		audio_stream_player.play()
		$InGameUI.visible = true
		
	next_level += 1

func time_out() -> void:
	level_fade.fade_black_and_call(load_game_over_scene)

func load_game_over_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/game_over.tscn")

func won_game() -> void:
	var won_scene = preload("res://scenes/UI/game_completed.tscn").instantiate()
	get_tree().root.add_child(won_scene)
	get_tree().current_scene = won_scene
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
		$Level1/Zipper.freeze()

func _on_skateboard_detector_body_exited(body):
	if body.name == "Board":
		$Level1/Zipper.unfreeze()

func _on_pen_detector_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "pen area":
		print("bag closed")
		$Level2/Sepparator/CollisionShape2D.disabled = false

func _on_pen_detector_2_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "pen2 area":
		$"Background/2_level".red = true
	elif area.name == "pen area":
		$"Background/2_level".blue = true


func _on_pen_detector_2_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "pen2 area":
		$"Background/2_level".red = false
	elif area.name == "pen area":
		$"Background/2_level".blue = false


func _on_bag_closer_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "pen area":
		print("bag closed")
		$Level2/Sepparator/CollisionShape2D.disabled = false


func _on_area_2d_body_exited(body):
	if body.name == "Padlock":
		$Level0/Zipper.unfreeze()
