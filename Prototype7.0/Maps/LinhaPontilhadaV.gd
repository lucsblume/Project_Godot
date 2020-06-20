extends Sprite


func _process(delta):
	if Input.is_action_pressed("MoreUp"): #APERTE U
		position.y-= 6
	if Input.is_action_pressed("MinDown"): #APERTE J
		position.y+= 6