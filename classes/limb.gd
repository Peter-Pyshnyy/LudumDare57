class_name  Limb extends CharacterBody2D

var _dragging : bool = false
var offset : Vector2 = Vector2(0, 0)
@export var is_palm : bool
@export var push_force : float

func _process(delta: float) -> void:
	if _dragging:
		var current_position : Vector2 = global_position
		var mouse_position : Vector2 = get_global_mouse_position() - offset
		
		var distance : float = current_position.distance_to(mouse_position)
		if distance > 10:
			distance = 10
		
		var direction : Vector2 = (current_position.direction_to(mouse_position)).normalized()
		
		var speed : float = (distance / delta)
		
		velocity = direction * speed
		#velocity = direction * 0.1 / delta
		move_and_slide()
		
		#if is_palm and $"Grip Manager".gripped:
			#$"Grip Manager".gripped_object.velocity = direction * 0.1 / delta
			#$"Grip Manager".move_and_slide()
		#else:
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(direction.normalized() * push_force)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and _dragging and not event.is_pressed():
		_dragging = false

#func _on_Draggable_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT:
				#_dragging = event.is_pressed()
