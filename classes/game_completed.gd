extends Control

@onready var level_fade: Fade = $LevelFade
@onready var nutella: Sprite2D = $end_character/blood
@onready var mustard: Sprite2D = $end_character/mustard
@onready var caffe: Sprite2D = $end_character/caffe
@onready var homework: Sprite2D = $Homework
@onready var hw_coffe: Sprite2D = $Homework/HwCoffe
@onready var hw_mustard: Sprite2D = $Homework/HwMustard
@onready var hw_nutella: Sprite2D = $Homework/HwBlood
@onready var a: Sprite2D = $Homework/A
@onready var b: Sprite2D = $Homework/B
@onready var c: Sprite2D = $Homework/C
@onready var d: Sprite2D = $Homework/D
@onready var hw_text: Sprite2D = $Homework/HwText
@onready var hw_red_circle: Sprite2D = $Homework/HwRedCircle

var num_clicks = 0

func back_to_menu() -> void:
	print("back to main")
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")

func set_stain(nutella_spilled: bool, mustard_spilled: bool, coffee_spilled: bool) -> void:
	nutella.visible = nutella_spilled
	mustard.visible = mustard_spilled
	caffe.visible = coffee_spilled
	hw_nutella.visible = nutella_spilled
	hw_mustard.visible = mustard_spilled
	hw_coffe.visible = coffee_spilled
	
	var grade: int = int(nutella_spilled) + int(mustard_spilled) + int(coffee_spilled)
	
	match grade:
		0:
			a.visible = true
		1:
			b.visible = true
		2:
			c.visible = true
		3:
			d.visible = true 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && num_clicks == 0 && event.is_pressed():
		num_clicks += 1
		homework.visible = true
		hw_text.visible = true
		hw_red_circle.visible = true

	elif event is InputEventMouseButton && event.is_pressed():
		level_fade.fade_black_and_call(back_to_menu)
