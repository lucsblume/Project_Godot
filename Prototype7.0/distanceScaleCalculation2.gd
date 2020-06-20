extends Node2D
onready var label2 = $labelScale2
var shoot_angle = 0
var init_velocity = 120 #aumenta o tamanho da linha
var gravity = 9.80665
var dt = 0.1 #distancia entre as bolinhas da trajetoria
var gun_pos = Vector2(45,310) # X e Y



func ballistic():
	var Vx = init_velocity*cos(shoot_angle)
	var Vy = init_velocity*sin(shoot_angle)
	var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity
	var T = 2*init_velocity*sin(shoot_angle)/gravity
	draw_line(gun_pos,Vector2(gun_pos.x+L,gun_pos.y),Color(0,0.7,0),10.0)#Color(0,0,1)#cor da linha,6.0)#grossura da linha
	for t in range(T/dt+1):
		var X = Vx * t * dt 
		var Y = Vy * t * dt - gravity * pow(t*dt,2)/2
		draw_circle(Vector2(gun_pos.x+X,gun_pos.x),2,Color(1,1,1)) #desenha trajetoria em X apenas
		#draw_circle(Vector2(gun_pos.x+X,gun_pos.y-Y),2,Color(1,1,1)) #trajetoria balistica

func _input(event):
	if Input.is_action_pressed("More2")and shoot_angle < 1.57:
		shoot_angle += 0.01;
		update()
	if Input.is_action_pressed("Min2") and shoot_angle > 0:
		shoot_angle -= 0.01;
		update()
		



func _draw():ballistic()

func _process(delta):
	label2.set_text(str(shoot_angle*100))

