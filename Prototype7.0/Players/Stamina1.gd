extends Node2D

var stamina = 100
var current_angle = -1.6 
 
var min_angle = -1.6
var max_angle = 4.7

func _draw():
	#draw_arc(center: Vector2, radius: float, start_angle: float, end_angle: float, point_count: int, color: Color, width: float = 1.0, antialiased: bool = false)
	draw_stamina_meter(Vector2(0,0), 40, 37, current_angle,Color('#71e958'))
	
	draw_stamina_meter(Vector2(0,0), 70, 11, 2, Color('#ff3434'))


func draw_stamina_meter(pos, size, width, current, color):
	#Background
	draw_arc(pos, size,  max_angle, min_angle, 800, Color(0,0,0,0.5), width, true)
	
	
	#Foreground Grenn Arc 
	draw_arc(pos, size,  max_angle, current, 800, color, width, true)
	
	

func _process(delta):
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		stamina -= 1
	
	stamina = clamp(stamina,0,100) #retorna um valor não inferior ao minimo e não superior ao maximo
	
	var value = ((min_angle * -1) + max_angle) / 100
	current_angle = max_angle - (stamina * value)
	
	print(stamina)
	
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		update()
	
