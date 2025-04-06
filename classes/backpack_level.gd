extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D.global_position.y = 324


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_movement_pressed() -> void:
	$Camera2D.global_position.y = 724


func _on_move_level_3_pressed() -> void:
	$Camera2D.global_position.y = 1224.0
