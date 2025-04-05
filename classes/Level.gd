class_name Level extends Node2D

signal coffee_spilled
signal nutella_spilled
signal mayo_spilled
signal blood_spilled

signal level_exited

func emit_coffee_spilled() -> void:
	coffee_spilled.emit()
func emit_nutella_spilled() -> void:
	nutella_spilled.emit()
func emit_mayo_spilled() -> void:
	mayo_spilled.emit()
func emit_blood_spilled() -> void:
	blood_spilled.emit()

func emit_level_exited() -> void:
	level_exited.emit()
