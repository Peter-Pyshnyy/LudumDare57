extends Node2D	

var last_id: int = -1
var last_time: int

var lifes: int = 10

@onready var seam_halfcut: Sprite2D = $SeamHalfcut
@onready var seam_cut: Sprite2D = $SeamCut

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body_shape_index > 0 && body_shape_index != last_id:
		last_id = body_shape_index
		print("new id: ", last_id)
		
		if Time.get_ticks_msec() - last_time < 1000:
			lifes -= 1
			print("reduce life, ", lifes)
			if lifes < 8:
				seam_halfcut.visible = true
			if lifes <= 0:
				seam_cut.show()
				process_mode = Node.PROCESS_MODE_DISABLED
		
		last_time = Time.get_ticks_msec()
