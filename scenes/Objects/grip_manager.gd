extends Node
@onready var grip_listener_thumb = $"../Skeleton2D/Palm/Thumb1/Thumb2/Thumb Anchor/GripListener"
@onready var grip_listener_index = $"../Skeleton2D/Palm/Index1/Index2/Index Anchor/GripListener"
@onready var unlock_timer = $"Unlock Timer"

var object_thumb : RigidBody2D
var object_index : RigidBody2D
var gripped = false
var gripped_object : RigidBody2D
var thumb_unlocked = false
var index_unlocked = false
var ready_to_unlock = false

#signal grip(body)
#signal ungrip()
func _ready():
	grip_listener_index.connect("touched", thumb_obj_add)
	grip_listener_index.connect("untouched", thumb_obj_remove)
	grip_listener_thumb.connect("touched", index_obj_add)
	grip_listener_thumb.connect("untouched", index_obj_remove)

func thumb_obj_add(body):
	print("emit reseived")
	if object_index == body:
		unlock_timer.stop()
		if not gripped:
			gripped_object = body
			gripped = true
			ready_to_unlock = false
			thumb_unlocked = false
			body.set_collision_layer_value(17, false)
			print("LOCKED")
	object_thumb = body
	
	if gripped and body == gripped_object:
		ready_to_unlock = false

func thumb_obj_remove(body):
	if body == gripped_object:
		thumb_unlocked = true
		print("thumb unlocked")
		if thumb_unlocked:
			ready_to_unlock = true
			print("ready to unlock")
			#unlock_timer.start(0)
	object_thumb = null

func index_obj_add(body):
	print("emit reseived")
	if object_thumb == body:
		unlock_timer.stop()
		if not gripped:
			gripped_object = body
			gripped = true
			ready_to_unlock = false
			index_unlocked = false
			body.set_collision_layer_value(17, false)
			print("LOCKED")
	object_index = body
	
	if gripped and body == gripped_object:
		ready_to_unlock = false

func index_obj_remove(body):
	if body == gripped_object:
		index_unlocked = true
		print("index unlocked")
		if thumb_unlocked:
			ready_to_unlock = true
			print("ready to unlock")
			#unlock_timer.start(0)
	object_index = null

func unlock():
	gripped_object.set_collision_layer_value(17, true)
	gripped_object = null
	gripped = false
	ready_to_unlock = false
	unlock_timer.stop()
	print("UNLOCKED")


func _on_unlock_timer_timeout():
	var distanve = $"..".global_position.distance_to(gripped_object.global_position)
	
	#unlock()
