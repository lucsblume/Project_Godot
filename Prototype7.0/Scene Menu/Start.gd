extends Button


func _on_Start_mouse_entered(): # editando as cores quando o mouse tiver em cima do botão
	$ButtonSprite.modulate.r = 0.7
	$ButtonSprite.modulate.g = 0.7
	$ButtonSprite.modulate.b = 0.7


func _on_Start_mouse_exited(): # editando as cores quando o mouse tiver saido do botão
	$ButtonSprite.modulate.r = 1
	$ButtonSprite.modulate.g = 1
	$ButtonSprite.modulate.b = 1


func _on_Start_pressed():#editando as cores quando o botão for pressionado
	$ButtonSprite.modulate.r = 0.5
	$ButtonSprite.modulate.g = 0.5
	$ButtonSprite.modulate.b = 0.5
	get_tree().change_scene("res://Maps/Map01.tscn") #ao clicar no botão ele vai pegar todo o projeto e muda a cena para a cena escolhida
	
