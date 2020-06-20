extends Sprite


func _process(delta):
	if Input.is_action_pressed("More"): #APERTE M
		position.x += 6
	if Input.is_action_pressed("Min"): #APERTE N
		position.x -= 6