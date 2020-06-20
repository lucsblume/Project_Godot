extends Node2D

var playerPosition
var valorAux

func _process(delta):
	playerPosition = $Player2.get_position()
	$AnimationPlayer/Sprite.set_position(playerPosition)

func _on_areaDanoP2_area_entered(area):
	if(area.is_in_group("Inimigo_doPlayer2")):
		if(area.has_method("danoCausadoPlayer2")):
			area.danoCausadoPlayer2(25)
			pass
