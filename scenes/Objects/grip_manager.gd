extends Node
@onready var grip_listener_thumb = $"../Skeleton2D/Palm/Thumb1/Thumb2/Thumb Anchor/GripListener"
@onready var grip_listener_index = $"../Skeleton2D/Palm/Index1/Index2/Index Anchor/GripListener"

var objects = {}
var gripped = false
var gripped_object : RigidBody2D
var ready_to_unlock = false

#signal grip(body)
#signal ungrip()

func _ready():
	grip_listener_index.connect("touched", obj_add)
	grip_listener_index.connect("untouched", obj_remove)
	grip_listener_thumb.connect("touched", obj_add)
	grip_listener_thumb.connect("untouched", obj_remove)

func obj_add(body):
	print("emit reseived")
	if objects.has(body) and not gripped:
		gripped_object = body
		gripped = true
		ready_to_unlock = false
		body.set_collision_layer_value(17, false)
		print("LOCKED")
	objects[body] = null
	
	if gripped and body == gripped_object:
		ready_to_unlock = false

func obj_remove(body):
	if body == gripped_object:
		ready_to_unlock = true
		print("redy to unlock")
	objects.erase(body)

func unlock():
	gripped_object.set_collision_layer_value(17, true)
	gripped_object = null
	gripped = false
	ready_to_unlock = false
	print("UNLOCKED")
