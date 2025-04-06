extends Skeleton2D

@onready var thumb_anchor = $"Palm/Thumb1/Thumb2/Thumb Anchor"
@onready var index_anchor = $"Palm/Index1/Index2/Index Anchor"
@onready var mid_anchor = $"Palm/Mid1/Mid2/Mid Anchor"
@onready var ring_anchor = $"Palm/Ring1/Ring2/Ring Anchor"
@onready var pinky_anchor = $"Palm/Pinky1/Pinky2/Pinky Anchor"
@onready var limb_hand = $".."
@onready var limb_thumb = $"Palm/IK Targets/Limb Thumb"
@onready var limb_index = $"Palm/IK Targets/Limb Index"
@onready var limb_mid = $"Palm/IK Targets/Limb Mid"
@onready var limb_ring = $"Palm/IK Targets/Limb Ring"
@onready var limb_pinky = $"Palm/IK Targets/Limb Pinky"



var target: Node2D
var limb: Limb
var is_palm = false
var offset: Vector2
var dir: Vector2

func _input(event):
	if is_palm and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			limb_hand.rotate(deg_to_rad(-3))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			limb_hand.rotate(deg_to_rad(3))

func _physics_process(delta):
	pass

func focus_limb(l: Limb):
	limb = l
	limb.offset = get_global_mouse_position() - limb.global_position
	limb._dragging = true

func unfocus_limb():
	limb._dragging = false
	reset_anchors()

func reset_anchors():
	limb_thumb.global_position = thumb_anchor.global_position
	limb_index.global_position = index_anchor.global_position
	limb_mid.global_position = mid_anchor.global_position
	limb_ring.global_position = ring_anchor.global_position
	limb_pinky.global_position = pinky_anchor.global_position

func _on_thumb_select_button_down():
	focus_limb(limb_thumb)
	
func _on_thumb_select_button_up():
	unfocus_limb()

func _on_index_select_button_down():
	focus_limb(limb_index)


func _on_index_select_button_up():
	unfocus_limb()


func _on_mid_select_button_down():
	focus_limb(limb_mid)


func _on_mid_select_button_up():
	unfocus_limb()


func _on_ring_select_button_down():
	focus_limb(limb_ring)


func _on_ring_select_button_up():
	unfocus_limb()


func _on_pinky_select_button_down():
	focus_limb(limb_pinky)


func _on_pinky_select_button_up():
	unfocus_limb()


func _on_palm_select_button_down():
	is_palm = true
	focus_limb(limb_hand)


func _on_palm_select_button_up():
	is_palm = false
	unfocus_limb()
