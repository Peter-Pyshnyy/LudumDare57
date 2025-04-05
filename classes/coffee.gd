extends RigidBody2D

var spilled: bool = false

signal spilled_signal

func _physics_process(delta: float) -> void:
	if transform.get_rotation() > 70 || transform.get_rotation() < -70:
		if !spilled:
			spilled = true
			spilled_signal.emit()
