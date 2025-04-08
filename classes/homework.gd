class_name Homework extends RigidBody2D

signal nutellaed

func set_stain(blood_spilled: bool, mustard_spilled: bool, coffee_spilled: bool) -> void:
	pass

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Knife":
		nutellaed.emit()
