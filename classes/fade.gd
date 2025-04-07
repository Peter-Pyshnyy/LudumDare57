class_name Fade extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.color = Color(0, 0, 0, 1)
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(color_rect, "color", Color(0,0,0,0), 1)
	
func fade_black_and_call(callback: Callable) -> void:
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(color_rect, "color", Color(0,0,0,1), 1)
	tween.tween_callback(callback)
