extends Area2D

var vida = 100

func _ready():
	add_to_group("Inimigo_doPlayer1")
	
func danoCausadoPlayer1(dano):
	vida -= dano
	print(vida)