extends Node2D

@onready var base_col: CollisionShape2D = $Base/BaseCol
@onready var groove_joint_2d: GrooveJoint2D = $GrooveJoint2D
@onready var slider: RigidBody2D = $Handle

var collision_shape: SegmentShape2D

func _ready() -> void:
	collision_shape = base_col.shape
	if collision_shape:
		collision_shape.a.x = groove_joint_2d.position.x - groove_joint_2d.length

func _physics_process(delta: float) -> void:
	if collision_shape:
		collision_shape.b.x = slider.position.x


func _on_handle_body_entered(body):
	pass


func _on_handle_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.

func freeze():
	$Handle.freeze = true
	$Handle/Sprite2D.texture = load("res://assets/sprites/zipper/zipper_frozen.png")

func unfreeze():
	$Handle.freeze = false
	$Handle/Sprite2D.texture = load("res://assets/sprites/zipper/zipper.png")
