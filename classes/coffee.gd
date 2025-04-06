extends RigidBody2D

var spilled: bool = false

signal spilled_signal

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

# GRIP MECHANIC START ------------------------------------------
@export var grips : Array[GripDetector]
var grip_lock : int
var current_grip_count = 0

func _ready():
	grip_lock = grips.size()
	for grip in grips:
		grip.connect("is_gripped", grip_count_inc)
		grip.connect("is_released", grip_count_dec)

func grip_count_inc():
	current_grip_count += 1
	print(current_grip_count)

func grip_count_dec():
	current_grip_count -= 1
	print(current_grip_count)

# GRIP MECHANIC END ------------------------------------------

func _physics_process(delta: float) -> void:
	if current_grip_count == grip_lock:
		set_collision_layer_value(17, false)
		print("LOCKED")
	else:
		set_collision_layer_value(17, true)
		#print("RELEASED")
	
	#print("coffee rot: ", transform.get_rotation())
	if transform.get_rotation() > deg_to_rad(70) || transform.get_rotation() < deg_to_rad(-70):
		gpu_particles_2d.emitting = true
		if !spilled:
			spilled = true
			spilled_signal.emit()
	else:
		gpu_particles_2d.emitting = false
