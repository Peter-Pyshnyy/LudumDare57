class_name GripDetector extends Node2D
signal is_gripped
signal is_released

func _on_area_2d_body_entered(body):
	if body is Limb:
		is_gripped.emit()


func _on_area_2d_body_exited(body):
	if body is Limb:
		is_released.emit()
