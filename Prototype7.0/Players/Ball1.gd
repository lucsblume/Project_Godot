extends KinematicBody2D

signal is_on_floor

func _process(delta):
	move_and_slide(Vector2(0, 0))
	if(get_slide_count() > 0):   
		emit_signal("is_on_floor") 
	else:
		move_and_slide(Vector2(0, 0))
