extends CanvasLayer

var rpm
var rpm2
var radius
var radius2
var angleStop
var angleStop2



func _ready():
	#$SliderRaio2.set_visible(false)
	#$SliderRpm2.set_visible(false)
	#$SliderAngulo2.set_visible(false)
	#$LabelAngle2.set_visible(false)
	#$LabelRadius2.set_visible(false)
	#$LabelRpm2.set_visible(false)
	#$LifeBar2/Control.set_visible(false)
	#$LifeBar2/health2.set_visible(false)
	#$LifeBar2/VidaLabelChar2.set_visible(false)
	#$Margin/HBoxContainer/Game2/Interface.set_visible(false)
	#$Margin/HBoxContainer/Game2/stamina2.set_visible(false)
	#$Margin/HBoxContainer/Game2/StaminaLabel2.set_visible(false)
	#$Margin/HBoxContainer/SpriteAuxRaio2.set_visible(false)
	#$Margin/HBoxContainer/SpriteAuxAnglo2.set_visible(false)
	#$Margin/HBoxContainer/SpriteAuxRpm2.set_visible(false)
	pass
	
func _process(delta):
	rpm = $SliderRpm.value
	rpm2 = $SliderRpm2.value
	radius = $SliderRaio.value
	radius2 = $SliderRaio2.value
	angleStop = $SliderAngulo.value
	angleStop2 = $SliderAngulo2.value