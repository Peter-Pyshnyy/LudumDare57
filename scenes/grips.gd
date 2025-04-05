extends Skeleton2D

@onready var thumb_target = $"Palm/IK Targets/Thumb Target"
@onready var index_target = $"Palm/IK Targets/Index Target"
@onready var mid_target = $"Palm/IK Targets/Mid Target"
@onready var ring_target = $"Palm/IK Targets/Ring Target"
@onready var pinky_target = $"Palm/IK Targets/Pinky Target"
@onready var thumb_anchor = $"Palm/Thumb1/Thumb2/Thumb Anchor"
@onready var index_anchor = $"Palm/Index1/Index2/Index Anchor"
@onready var mid_anchor = $"Palm/Mid1/Mid2/Mid Anchor"
@onready var ring_anchor = $"Palm/Ring1/Ring2/Ring Anchor"
@onready var pinky_anchor = $"Palm/Pinky1/Pinky2/Pinky Anchor"
@onready var limb_hand = $".."
@onready var limb_index = $"Palm/IK Targets/Limb Index"


var target: Node2D
var limb: Limb
var is_dragging = false
var is_palm = false
var offset: Vector2
var dir: Vector2

func _input(event):
	if is_palm and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			limb_hand.rotate(deg_to_rad(-3))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			limb_hand.rotate(deg_to_rad(3))
	if event is InputEventMouseMotion:
		if is_dragging:
			target.global_position = get_global_mouse_position() - offset
			print($"../CollisionShape2D".position)

func _physics_process(delta):
	pass

func focus_target(t: Node2D):
	target = t
	offset = get_global_mouse_position() - target.global_position
	is_dragging = true

func focus_limb(l: Limb):
	limb = l
	limb.offset = get_global_mouse_position() - limb.global_position
	limb._dragging = true

func unfocus_limb():
	limb._dragging = false
	reset_anchors()

func unfocus():
	is_dragging = false
	reset_anchors()

func reset_anchors():
	thumb_target.global_position = thumb_anchor.global_position
	limb_index.global_position = index_anchor.global_position
	mid_target.global_position = mid_anchor.global_position
	ring_target.global_position = ring_anchor.global_position
	pinky_target.global_position = pinky_anchor.global_position

func _on_thumb_select_button_down():
	focus_target(thumb_target)
	
func _on_thumb_select_button_up():
	unfocus()

func _on_index_select_button_down():
	focus_limb(limb_index)


func _on_index_select_button_up():
	unfocus_limb()


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
	focus_limb(limb_hand)


func _on_palm_select_button_up():
	unfocus_limb()
