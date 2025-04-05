extends Node2D

@onready var base_col: CollisionShape2D = $Base/BaseCol
@onready var groove_joint_2d: GrooveJoint2D = $GrooveJoint2D
@onready var slider: RigidBody2D = $Slider

var collision_shape: SegmentShape2D

func _ready() -> void:
	collision_shape = base_col.shape
	if collision_shape:
		collision_shape.a.x = groove_joint_2d.position.x - groove_joint_2d.length

func _physics_process(delta: float) -> void:
	if collision_shape:
		collision_shape.b.x = slider.position.x
