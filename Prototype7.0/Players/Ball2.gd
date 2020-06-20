extends KinematicBody2D

signal is_on_floorP2

func _process(delta):
	move_and_slide(Vector2(0, 0))
	if(get_slide_count() > 0):
		emit_signal("is_on_floorP2")
	else:
		move_and_slide(Vector2(0, 0))
