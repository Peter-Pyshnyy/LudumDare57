extends RigidBody2D

@export var num : int

func _ready():
	if num == 0:
		$Sprite.texture = load("res://assets/sprites/Blue_pen.png")
	else:
		$Sprite.texture = load("res://assets/sprites/Red_pen.png")
