class_name Game extends Node

@export var levels: Array[PackedScene]
var current_level: Level
var next_level = 0

var coffee_spilled: bool = false
var nutella_spilled: bool = false
var mayo_spilled:bool = false
var blood_spilled:bool = false

func start_game() -> void:
	#start timer
	#load level
	load_next_level()

func exit_level() -> void:
	if next_level > levels.size() -1:
		won_game()
	else:
		load_next_level()

func load_next_level() -> void:
	if current_level:
		#disconnect signlas
		current_level.coffee_spilled.disconnect(set_coffee_spilled)
		current_level.nutella_spilled.disconnect(set_nutella_spilled)
		current_level.mayo_spilled.disconnect(set_mayo_spilled)
		current_level.blood_spilled.disconnect(set_blood_spilled)
		
		current_level.level_exited.disconnect(exit_level)
		
		# remove scene
		current_level.queue_free()
	
	#intantiate scene
	current_level = levels[next_level].instantiate()
	# connect signals
	current_level.coffee_spilled.connect(set_coffee_spilled)
	current_level.nutella_spilled.connect(set_nutella_spilled)
	current_level.mayo_spilled.connect(set_mayo_spilled)
	current_level.blood_spilled.connect(set_blood_spilled)

	current_level.level_exited.connect(exit_level)
	
	next_level += 1

func time_out() -> void:
	pass

func won_game() -> void:
	pass

func set_coffee_spilled() -> void:
	coffee_spilled = true

func set_nutella_spilled() -> void:
	nutella_spilled = true
	
func set_mayo_spilled() -> void:
	mayo_spilled = true
	
func set_blood_spilled() -> void:
	blood_spilled = true
