class_name GripDetector extends Node2D
signal is_gripped(body)
signal is_released(body)

func _on_area_2d_body_entered(body):
	if body is Limb:
		is_gripped.emit(body)


func _on_area_2d_body_exited(body):
	if body is Limb:
		is_released.emit(body)
