extends Node2D

var playerPosition
var valorAux

func _process(delta):
	playerPosition = $Player2.get_position()
	$AnimationPlayer/Sprite.set_position(playerPosition)
