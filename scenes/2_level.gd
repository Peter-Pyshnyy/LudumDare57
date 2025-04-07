extends Node2D

var blue = false
var red = true

func _process(delta):
	if not blue and not red:
		$"../../Level2/Zipper".unfreeze()
	else:
		$"../../Level2/Zipper".freeze()
