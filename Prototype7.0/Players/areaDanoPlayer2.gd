extends Area2D

var vida = 100
signal causarDanoP2

func _ready():
	add_to_group("Inimigo_doPlayer1")
	
func danoCausadoPlayer1(dano):
	vida -= dano
	emit_signal("causarDanoP2")
	print(vida)