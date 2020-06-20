extends Sprite

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += 2.5
	if Input.is_action_pressed("ui_left"):
		position.x -= 2.5