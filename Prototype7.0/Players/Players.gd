extends Node2D

var playerPosition
var valorAux


func _process(delta):
	playerPosition = $Player.get_position()
	valorAux = Vector2(0, 30)
	$AnimationPlayer/Sprite.set_position(playerPosition + valorAux)


