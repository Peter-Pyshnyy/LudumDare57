extends CanvasLayer

@export var timer: Timer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label

func _process(delta: float) -> void:
	if !timer.is_stopped():
		var percent := timer.time_left / timer.wait_time
		if percent > 0.75:
			animated_sprite_2d.animation = "phase1"
		elif percent > 0.5:
			animated_sprite_2d.animation = "phase2"
		elif percent > 0.25:
			animated_sprite_2d.animation = "phase3"
		else:
			animated_sprite_2d.animation = "phase4"
			
		label.text = seconds_to_string(timer.time_left)

static func seconds_to_string(time: float, decimals: int = 0) -> String:
	var out = ""
	
	var minutes := str(floori(fmod(time / 60, 60)))
	var seconds := str(floori(fmod(time, 60)))
	
	
	if seconds.length() < 2:
		seconds = "0" + seconds
	
	out = minutes + ":" + seconds
	
	if decimals > 0:
		var millisec := str(floori(fmod(time, 1) * pow(10, decimals)))
		
		if millisec.length() < decimals:
			for i in decimals - millisec.length():
				millisec += "0"
		
		out = out + "." + millisec
	
	return out
