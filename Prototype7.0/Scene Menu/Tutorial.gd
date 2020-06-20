extends Button


func _on_Tutorial_mouse_entered():
	$ButtonSprite.modulate.r = 0.7
	$ButtonSprite.modulate.g = 0.7
	$ButtonSprite.modulate.b = 0.7

func _on_Tutorial_mouse_exited():
	$ButtonSprite.modulate.r = 1
	$ButtonSprite.modulate.g = 1
	$ButtonSprite.modulate.b = 1
	
func _on_Tutorial_pressed():
	$ButtonSprite.modulate.r = 0.5
	$ButtonSprite.modulate.g = 0.5
	$ButtonSprite.modulate.b = 0.5
	get_tree().change_scene("res://TutorialScene/Tutorial.tscn")
	

	
