extends Control

@onready var level_fade: Fade = $LevelFade

func back_to_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		level_fade.fade_black_and_call(back_to_menu)
