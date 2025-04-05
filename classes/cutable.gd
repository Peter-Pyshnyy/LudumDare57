extends Node2D	

var last_id: int = -1
var last_time: int

var lifes: int = 15

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body_shape_index > 0 && body_shape_index != last_id:
		last_id = body_shape_index
		print("new id: ", last_id)
		
		if Time.get_ticks_msec() - last_time < 1000:
			lifes -= 1
			print("reduce life, ", lifes)
			if lifes <= 0:
				queue_free()
		
		last_time = Time.get_ticks_msec()
