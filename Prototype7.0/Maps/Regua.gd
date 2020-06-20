extends Sprite


func _process(delta):
	if Input.is_action_pressed("More"):
		position.x += 5
	if Input.is_action_pressed("Min"):
		position.x -= 5