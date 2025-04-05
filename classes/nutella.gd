extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var mouse_pos = get_global_mouse_position().x - 577
	print(mouse_pos)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity.x += mouse_pos * delta 
	

	move_and_slide()
