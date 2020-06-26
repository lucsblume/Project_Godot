extends KinematicBody2D

var can_move = true

var resetState = false #CHECAR SE TA FALSO

export(int) var run_speed = 150
export(int) var jump_speed = -450
export(int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_pressed('ui_up')
	
	#if Game_Manager.stamina_p1 <= 0: #checando valor da stamina  ############ APAGAR ##############
	#	return ############ APAGAR ##############
	
	if jump and is_on_floor():
		#print("Is on Floor")
		jumping = true
		velocity.y = jump_speed
		
	if right:
		velocity.x += run_speed 
		
	if left: 
		velocity.x -= run_speed  
		
	if Input.is_action_pressed("zoomCameraP1"):
		$Camera2DP1.set_zoom(Vector2(1.180, 1.180))
	elif Input.is_action_pressed("zoomOutP1"):
		$Camera2DP1.set_zoom(Vector2(1.0, 1.0))
		
		
	

func _physics_process(delta):
	
	
	get_input()

	
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if get_node("Stamina1").stamina == 0:
		run_speed = 0
		jump_speed = 0
		
		
