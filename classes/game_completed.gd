extends Control

@onready var level_fade: Fade = $LevelFade
@onready var blood: Sprite2D = $end_character/blood
@onready var mustard: Sprite2D = $end_character/mustard
@onready var caffe: Sprite2D = $end_character/caffe

var num_clicks = 0

func back_to_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func set_stain(blood_spilled: bool, mustard_spilled: bool, coffee_spilled: bool) -> void:
	blood.visible = blood_spilled
	mustard.visible = mustard_spilled
	caffe.visible = coffee_spilled

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && num_clicks == 0:
		pass
		#show grade
	elif event is InputEventMouseButton:
		level_fade.fade_black_and_call(back_to_menu)
