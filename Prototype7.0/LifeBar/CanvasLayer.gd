extends CanvasLayer

var can = 100

func _ready():
	set_physics_process(true)
	set_process_input(true)
	pass
func _input(event):
	if event.is_action_pressed("life"):#life = "l"
		can -= 10
		
func validarDanoCausadoP1():
	can -= 25
	if can <= 0:
		get_tree().change_scene("res://VitoriasScene/VitoriaP2.tscn")
func _physics_process(delta):
	get_node("Control/ProgressBar").set_value(can)
	#can += delta * 10 #caso queira que a barra se recupere, basta comentar esse trecho
