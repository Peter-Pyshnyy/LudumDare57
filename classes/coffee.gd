extends RigidBody2D

var spilled: bool = false

signal spilled_signal

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _physics_process(delta: float) -> void:
	print("coffee rot: ", transform.get_rotation())
	if transform.get_rotation() > deg_to_rad(70) || transform.get_rotation() < deg_to_rad(-70):
		gpu_particles_2d.emitting = true
		if !spilled:
			spilled = true
			spilled_signal.emit()
	else:
		gpu_particles_2d.emitting = false
