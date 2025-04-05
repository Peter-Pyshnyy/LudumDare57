extends Skeleton2D

@onready var thumb_target = $"Palm/IK Targets/Thumb Target"
@onready var index_target = $"Palm/IK Targets/Index Target"
@onready var mid_target = $"Palm/IK Targets/Mid Target"
@onready var ring_target = $"Palm/IK Targets/Ring Target"
@onready var pinky_target = $"Palm/IK Targets/Pinky Target"
@onready var palm = $Palm
@onready var thumb_anchor = $"Palm/Thumb1/Thumb2/Thumb Anchor"
@onready var index_anchor = $"Palm/Index1/Index2/Index Anchor"
@onready var mid_anchor = $"Palm/Mid1/Mid2/Mid Anchor"
@onready var ring_anchor = $"Palm/Ring1/Ring2/Ring Anchor"
@onready var pinky_anchor = $"Palm/Pinky1/Pinky2/Pinky Anchor"

var target: Node2D
var is_dragging = false
var is_palm = false
var offset: Vector2
var dir: Vector2

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			rotate(deg_to_rad(-3))
			offset = get_global_mouse_position() - target.global_position
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			rotate(deg_to_rad(3))
			offset = get_global_mouse_position() - target.global_position

func _physics_process(delta):
	if is_dragging:
		target.global_position = get_global_mouse_position() - offset
		print(target.position)

func focus_target(t: Node2D):
	target = t
	offset = get_global_mouse_position() - target.global_position
	is_dragging = true

func unfocus():
	is_dragging = false
	reset_anchors()

func reset_anchors():
	thumb_target.global_position = thumb_anchor.global_position
	index_target.global_position = index_anchor.global_position
	mid_target.global_position = mid_anchor.global_position
	ring_target.global_position = ring_anchor.global_position
	pinky_target.global_position = pinky_anchor.global_position

func _on_thumb_select_button_down():
	focus_target(thumb_target)
	
func _on_thumb_select_button_up():
	unfocus()

func _on_index_select_button_down():
	focus_target(index_target)


func _on_index_select_button_up():
	unfocus()


func _on_mid_select_button_down():
	focus_target(mid_target)


func _on_mid_select_button_up():
	unfocus()


func _on_ring_select_button_down():
	focus_target(ring_target)


func _on_ring_select_button_up():
	unfocus()


func _on_pinky_select_button_down():
	focus_target(pinky_target)


func _on_pinky_select_button_up():
	unfocus()


func _on_palm_select_button_down():
	focus_target(palm)


func _on_palm_select_button_up():
	unfocus()
