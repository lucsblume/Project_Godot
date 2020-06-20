tool
extends TextureProgress

func initialize(current, maximum):
	max_value = maximum
	value = current

func _on_Character_experience_gained(growth_data):
	for line in growth_data:
		var target_exp = line[0]
		var max_exp = line[1]
		max_value = max_exp
		yield(animate_value(target_exp), "completed")
		#if abs(max_value - value) < 0.01: #bloqueando esses comando, a barra de stamina reseta para o começa quando chegao ao fim e não ultrapassa seu limite
		#	value = 0.0

func animate_value(target, tween_duration=0.30):#tween_duration= duração do tempo de carregamento da barrra de progresso
	$Tween.interpolate_property(self, "value", value, target, tween_duration, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")

