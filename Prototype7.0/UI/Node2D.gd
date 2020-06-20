extends Node2D

var stamina = 100

func draw_circle_arc(center, radius, angle_from, angle_to, color):
    var nb_points = 90
    var points_arc = PoolVector2Array()

    for i in range(nb_points + 1):
        var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

    for index_point in range(nb_points):
        draw_line(points_arc[index_point], points_arc[index_point + 1], color)

func _draw():
    var center = Vector2(200, 200)
    var radius = 100
    var angle_from = 75
    var angle_to = 195
    var color = Color(1.0, 0.0, 0.0)
    draw_circle_arc(center, radius, angle_from, angle_to, color)
	
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		stamina += 1;
	if Input.is_action_pressed("ui_down"):
		stamina -= 1;
		
	stamina = clamp(stamina,0,100);
	print(stamina);