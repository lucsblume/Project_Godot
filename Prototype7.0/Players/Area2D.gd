extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	if(area.is_in_group("Inimigo_doPlayer1")):
		if(area.has_method("danoCausadoPlayer1")):
			area.danoCausadoPlayer1(25)
			pass
