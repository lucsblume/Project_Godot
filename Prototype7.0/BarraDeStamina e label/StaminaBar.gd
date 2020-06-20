extends CanvasLayer

onready var timer = get_node("Control/Timer")

signal stamina_barcount  #criando signal para checar quando a stamina chegar a zero



var resetState = false

func _ready():
	set_physics_process(true)
	set_process_input(true)
	pass
func _input(event):
	
	if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left") or event.is_action_pressed("ui_up"):
		timer.start()
		timer.set_wait_time(0.5)
		timer.set_one_shot(true)
		
		
	if Game_Manager.stamina_p1 <= 0: #checando valor do singleton
		emit_signal("stamina_barcount") 
	
		print(Game_Manager.stamina_p1)
		
		
		
func _physics_process(delta):
	get_node("Control/ProgressBar").set_value(Game_Manager.stamina_p1)
	#can += delta * 10 #caso queira que a barra se recupere, basta comentar esse trecho

func _on_Timer_timeout(): #quando o tempo chegar no final
	timer.stop()
	resetState = false
	Game_Manager.stamina_p1-= 34 ##decrementando de 100, no maximo 3 jogadas durante 1 segundo cada tecla
