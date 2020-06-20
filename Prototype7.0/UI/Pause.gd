extends Node

func _ready():
	$Label.visible = false
	$ButtonExit.visible = false
	#$voltar.visible = false #caso tenha que qtirar o botão nahora que der pause, é so comentar essa linha
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused == false:
			#$voltar.visible = true #caso tenha que qtirar o botão nahora que der pause, é so comentar essa linha
			get_tree().paused = true
			$Label.visible = true
			$ButtonExit.visible = true
			
		else:
			get_tree().paused = false
			$Label.visible = false
			$ButtonExit.visible = false
			#$voltar.visible = false
			

