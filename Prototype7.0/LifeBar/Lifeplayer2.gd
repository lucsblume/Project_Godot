extends CanvasLayer

var can = 100

func _ready():
	set_physics_process(true)
	set_process_input(true)
	pass
func _input(event):
	if event.is_action_pressed("life2"):#life = "l"
		can -= 10
		
		
func _physics_process(delta):
	get_node("Control/ProgressBar").set_value(can)
	can += delta * 2 #caso queira que a barra se recupere, basta comentar esse trecho