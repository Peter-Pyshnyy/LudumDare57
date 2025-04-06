extends Area2D

signal exit_level

var activated: bool = false


func _on_body_entered(body: Node2D) -> void:
	if body is Limb && !activated:
		activated = true
		exit_level.emit()
		queue_free()
