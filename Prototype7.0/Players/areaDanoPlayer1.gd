extends Area2D

var vida = 100

func _ready():
	add_to_group("Inimigo_doPlayer2")
	
func danoCausadoPlayer2(dano):
	vida -= dano
	print(vida)

