class_name GripListener extends Area2D

var gripped_object : RigidBody2D

signal touched(body)
signal untouched(body)

func _on_area_entered(area):
	if area is GripLock:
		touched.emit(area.get_parent())


func _on_area_exited(area):
	if area is GripLock:
		untouched.emit(area.get_parent())
