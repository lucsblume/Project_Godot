extends Area2D

var vida = 100
signal causarDanoP1

func _ready():
	add_to_group("Inimigo_doPlayer2")
	
func danoCausadoPlayer2(dano):
	vida -= dano
	emit_signal("causarDanoP1")
	print(vida)

