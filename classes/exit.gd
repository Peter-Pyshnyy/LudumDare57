extends Area2D

signal exit_level

var activated: bool = false

func exit() -> void:
	if !activated:
		activated = true
		exit_level.emit()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Limb:
		exit()
