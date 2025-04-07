class_name GripListener extends Area2D

var gripped_object : RigidBody2D

signal touched(body)
signal untouched(body)

func _on_area_entered(area):
	if area is GripLock:
		print(area)
		print("found a grip lock, emiting")
		touched.emit(area.get_parent())


func _on_area_exited(area):
	if area is GripLock:
		print("left, emiting")
		untouched.emit(area.get_parent())
