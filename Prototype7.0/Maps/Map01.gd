extends Node2D

var posicaoBase; var posicaoBaseP2; var posicaoAux; var angulo; var anguloP2; var raio = 46; var velocidade
var conversaoRad; var conversaoRadP2; var posXInicial; var posXInicialP2; var posYInicial; var posYInicialP2; var posInicial; var posInicialP2; var rpm; var rpmP2
var posInicialBola; var posInicialBolaP2; var velocidadeInicialX; var velocidadeInicialY; var posLancamento = Vector2(); var aceleracaoXP2; var aceleracaoYP2
var aceleracaoX; var aceleracaoY; const GRAVIDADE = 98; var aceleracao; var velocidadeP2; var velocidadeInicialXP2; var velocidadeInicialYP2
var aux = 0; var auxP2 = 0; var posInicialKinematic = Vector2(); var signalFlag = false; var signalFlagP2 = false; var posLancamentoP2; var aceleracaoP2
var lock = false; var lockP2 = false

onready var label = $Settings/Player/distancePixels
onready var label2 = $SettingsP2/Player2/distancePixels2
onready var label3 = $LabelScaleHorizontal
onready var label4 = $LabelScaleVertical


onready var sprite = $Settings/Player
onready var sprite2 = $SettingsP2/Player2
onready var sprite3 = $LinhaPontilhadaH
onready var sprite6 =$LinhaPontilhadaV
onready var sprite4 = $MedidorSpriteH
onready var sprite5 = $MedidorSpriteV


onready var anim = get_node("Settings/AnimationPlayer")
onready var animP2 = get_node("SettingsP2/AnimationPlayer")

func _ready():
	$BackgroundTop.visible = false
	$Divisa.visible = false
	$ReguaHorizontal.visible = false
	$LinhaPontilhadaH.visible = false
	$ReguaVertical.visible = false
	$ReguaVertical2.visible = false
	$LinhaPontilhadaV.visible = false
	$LabelScaleHorizontal.visible =false
	$LabelScaleVertical.visible = false
	set_camera_limits()

	$Settings/Ball1.connect("is_on_floor", self, "isTrue")
	$SettingsP2/Ball2.connect("is_on_floorP2", self, "isTrueP2")
	$Settings/Player/areaDanoPlayer1.connect("causarDanoP1", $HUD/LifeBar, "validarDanoCausadoP1")
	$SettingsP2/Player2/areaDanoPlayer2.connect("causarDanoP2", $HUD/LifeBar2, "validarDanoCausadoP2")

	$X.visible = false
	$Y.visible = false
	
func set_camera_limits():
	var limiteMapa = $TileMap.get_used_rect()
	var tamanhoCelulaMapa = $TileMap.cell_size
	$Settings/Player/Camera2DP1.limit_left = limiteMapa.position.x * tamanhoCelulaMapa.x
	$Settings/Player/Camera2DP1.limit_right = limiteMapa.end.x * tamanhoCelulaMapa.x
	$Settings/Player/Camera2DP1.limit_top = limiteMapa.position.y * tamanhoCelulaMapa.y
	$Settings/Player/Camera2DP1.limit_bottom = limiteMapa.end.y * tamanhoCelulaMapa.y
	$Settings/Ball1/Camera2DB1.limit_left = limiteMapa.position.x * tamanhoCelulaMapa.x
	$Settings/Ball1/Camera2DB1.limit_right = limiteMapa.end.x * tamanhoCelulaMapa.x
	$Settings/Ball1/Camera2DB1.limit_top = limiteMapa.position.y * tamanhoCelulaMapa.y
	$Settings/Ball1/Camera2DB1.limit_bottom = limiteMapa.end.y * tamanhoCelulaMapa.y
	$SettingsP2/Player2/Camera2DP2.limit_left = limiteMapa.position.x * tamanhoCelulaMapa.x
	$SettingsP2/Player2/Camera2DP2.limit_right = limiteMapa.end.x * tamanhoCelulaMapa.x
	$SettingsP2/Player2/Camera2DP2.limit_top = limiteMapa.position.y * tamanhoCelulaMapa.y
	$SettingsP2/Player2/Camera2DP2.limit_bottom = limiteMapa.end.y * tamanhoCelulaMapa.y
	$SettingsP2/Ball2/Camera2D.limit_left = limiteMapa.position.x * tamanhoCelulaMapa.x
	$SettingsP2/Ball2/Camera2D.limit_right = limiteMapa.end.x * tamanhoCelulaMapa.x
	$SettingsP2/Ball2/Camera2D.limit_top = limiteMapa.position.y * tamanhoCelulaMapa.y
	$SettingsP2/Ball2/Camera2D.limit_bottom = limiteMapa.end.y * tamanhoCelulaMapa.y
	

func _input(event):
	if event.is_action_pressed("VisibleHorizontal"):  #APERTE H
		$BackgroundTop.visible = not $BackgroundTop.visible
		$Divisa.visible = not $Divisa.visible
		$ReguaVertical.visible = not $ReguaVertical.visible
		$ReguaVertical2.visible = not $ReguaVertical2.visible
		$LinhaPontilhadaV.visible = not $LinhaPontilhadaV.visible
		$ReguaHorizontal.visible = not $ReguaHorizontal.visible #deixa as reguas invisieis quando pressionadas
		$LinhaPontilhadaH.visible = not $LinhaPontilhadaH.visible
		$LabelScaleHorizontal.visible = not $LabelScaleHorizontal.visible
		$LabelScaleVertical.visible = not $LabelScaleVertical.visible
		$X.visible = not $X.visible
		$Y.visible = not $Y.visible
		
func _process(delta):
	
	var distance = sprite.position.distance_to(sprite2.position)
	label.set_text(str(stepify(distance,1)/100))
	
	var distance2 = sprite2.position.distance_to(sprite.position)
	label2.set_text(str(stepify(distance2,1)/100))
	
	var distance3 = sprite3.position.distance_to(sprite4.position)
	label3.set_text(str(stepify(distance3,1)/100))
	
	var distance4 = sprite6.position.distance_to(sprite5.position)
	label4.set_text(str(stepify(distance4,1)/100))


	angulo = $HUD/SliderAngulo.value
	anguloP2 = $HUD/SliderAngulo2.value
	rpm = $HUD/SliderRpm.value * 0.10471975511965977
	rpmP2 = $HUD/SliderRpm2.value * 0.10471975511965977
	conversaoRad = deg2rad(-angulo)
	conversaoRadP2 = deg2rad(anguloP2)
	posXInicial = raio * cos(conversaoRad)
	posXInicialP2 = -raio * cos(conversaoRadP2)
	posYInicial = raio * sin(conversaoRad)
	posYInicialP2 = -raio * sin(conversaoRadP2)
	posInicial = Vector2(posXInicial, posYInicial)
	posInicialP2 = Vector2(posXInicialP2, posYInicialP2)
	posicaoBase = $Settings/Player.get_position()
	posicaoBaseP2 = $SettingsP2/Player2.get_position()
	posInicialBola = posInicial + posicaoBase
	posInicialBolaP2 = posInicialP2 + posicaoBaseP2
	velocidade = (2 * PI) * raio * rpm
	velocidadeP2 = (2 * PI) * raio * rpmP2
	posLancamento = posInicialBola
	posLancamentoP2 = posInicialBolaP2
	#print(int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees))
	
	if(Input.is_action_just_pressed("ui_select")):
		anim.play("AnimationSprite")
		
	if(Input.is_action_just_pressed("Shoot")):
		animP2.play("ArmAnimation")
		
	if((int($Settings/AnimationPlayer/Sprite.rotation_degrees) == -angulo) && int($Settings/AnimationPlayer/Sprite.rotation_degrees) != 0):
		$Settings/Ball1.set_visible(true)
		$Settings/AnimationPlayer/Sprite/AuxSprite.set_visible(false)
		$Settings/Ball1/Camera2DB1.make_current()
		$Settings/Ball1.set_position(posInicialBola)
		
	if((int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees) == anguloP2) && int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees) != 0):
		$SettingsP2/Ball2.set_visible(true)
		$SettingsP2/AnimationPlayer/Sprite/AuxSprite.set_visible(false)
		$SettingsP2/Ball2/Camera2D.make_current()
		$SettingsP2/Ball2.set_position(posInicialBolaP2)
		
	if((int($Settings/AnimationPlayer/Sprite.rotation_degrees) < -angulo) && (int($Settings/AnimationPlayer/Sprite.rotation_degrees) != -1) && (int($Settings/AnimationPlayer/Sprite.rotation_degrees) != -360)):
		var anguloArremesso = angulo
		var conversaoRadAnguloArremesso
		var posKinematic = $Settings/Ball1.get_position()
		#print(int($Settings/AnimationPlayer/Sprite.rotation_degrees))
		
		if(-angulo <= 0 && -angulo >= -90):
			anguloArremesso = 90 - anguloArremesso
			conversaoRadAnguloArremesso = deg2rad(-anguloArremesso)
			velocidadeInicialX = velocidade * cos(conversaoRadAnguloArremesso)
			velocidadeInicialY = velocidade * sin(conversaoRadAnguloArremesso)
			aceleracaoX = velocidadeInicialX * 3
			aux += GRAVIDADE * delta
			aceleracaoY = velocidadeInicialY + aux
			aceleracao = Vector2(-aceleracaoX * delta, aceleracaoY * delta)
			$Settings/Ball1.set_position(aceleracao + posKinematic)
			#print("fora ", aceleracao)
			#print("Conversão para radianos do ângulo 1: ", conversaoRad)
			anim.stop(false)
			if(lock == true):
				posInicial = Vector2(46, 0)
				posicaoBase = $Settings/Player.get_position()
				aux = 0
				posInicialBola = posInicial + posicaoBase
				$Settings/Ball1.set_position(posInicialBola)
				anim.play("AnimationSprite")
				
			
		if(-angulo <= -91 && -angulo >= -180):
			anguloArremesso = 90 - (anguloArremesso - 180)
			conversaoRadAnguloArremesso = deg2rad(anguloArremesso)
			velocidadeInicialX = velocidade * cos(conversaoRadAnguloArremesso)
			velocidadeInicialY = velocidade * sin(conversaoRadAnguloArremesso)
			aceleracaoX = velocidadeInicialX * 3
			aux += GRAVIDADE * delta
			aceleracaoY = velocidadeInicialY + aux
			aceleracao = Vector2(aceleracaoX * delta, aceleracaoY * delta)
			$Settings/Ball1.set_position(aceleracao + posKinematic)
			anim.stop(false)
			#print("Pos x:", posXInicial, ", Pos y: ", posYInicial)
			if(lock == true):
				posInicial = Vector2(46, 0)
				posicaoBase = $Settings/Player.get_position()
				aux = 0
				posInicialBola = posInicial + posicaoBase
				$Settings/Ball1.set_position(posInicialBola)
				anim.play("AnimationSprite")
				
			
		if(-angulo <= -181 && -angulo >= -270):
			anguloArremesso = 270 - anguloArremesso
			conversaoRadAnguloArremesso = deg2rad(anguloArremesso)
			velocidadeInicialX = velocidade * cos(conversaoRadAnguloArremesso)
			velocidadeInicialY = velocidade * sin(conversaoRadAnguloArremesso)
			aceleracaoX = velocidadeInicialX * 3#+ posXInicial
			aux += GRAVIDADE * delta
			aceleracaoY = velocidadeInicialY + aux
			aceleracao = Vector2(aceleracaoX * delta, aceleracaoY * delta)
			$Settings/Ball1.set_position(aceleracao + posKinematic)
			anim.stop(false)
			if(lock == true):
				posInicial = Vector2(46, 0)
				posicaoBase = $Settings/Player.get_position()
				aux = 0
				posInicialBola = posInicial + posicaoBase
				$Settings/Ball1.set_position(posInicialBola)
				anim.play("AnimationSprite")
				
		if(-angulo <= -271 && -angulo >= -360):
			anguloArremesso = anguloArremesso - 270
			conversaoRadAnguloArremesso = deg2rad(-anguloArremesso)
			velocidadeInicialX = velocidade * cos(conversaoRadAnguloArremesso)
			velocidadeInicialY = velocidade * sin(conversaoRadAnguloArremesso)
			aceleracaoX = velocidadeInicialX * 3 #+ posXInicial
			aux += GRAVIDADE * delta
			aceleracaoY = velocidadeInicialY + aux
			aceleracao = Vector2(aceleracaoX * delta, aceleracaoY * delta)
			$Settings/Ball1.set_position(aceleracao + posKinematic)
			anim.stop(false)
			if(lock == true):
				posInicial = Vector2(46, 0)
				posicaoBase = $Settings/Player.get_position()
				aux = 0
				posInicialBola = posInicial + posicaoBase
				$Settings/Ball1.set_position(posInicialBola)
				anim.play("AnimationSprite")
				
		var teste = int($Settings/AnimationPlayer/Sprite.rotation_degrees)
		
	if((int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees) > anguloP2) && (int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees) != 1) && (int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees) != 360)):
		var anguloArremessoP2 = anguloP2
		var conversaoRadAnguloArremessoP2
		var posKinematicP2 = $SettingsP2/Ball2.get_position()
		
		if(anguloP2 >= 0 && anguloP2 <= 90):
			#anguloArremessoP2 = 90 - anguloArremessoP2
			#anguloArremessoP2 = 90 - (anguloArremessoP2 - 180)
			anguloArremessoP2 = anguloArremessoP2 - 270
			#print("Angulo de arremesso: ", anguloArremessoP2)
			conversaoRadAnguloArremessoP2 = deg2rad(-anguloArremessoP2)
			#print("Conversão para radianos do ângulo 2: ", conversaoRadAnguloArremessoP2)
			velocidadeInicialXP2 = velocidadeP2 * cos(conversaoRadAnguloArremessoP2)
			velocidadeInicialYP2 = velocidadeP2 * sin(conversaoRadAnguloArremessoP2)
			aceleracaoXP2 = (velocidadeInicialXP2) * 3
			auxP2 += GRAVIDADE * delta
			aceleracaoYP2 = velocidadeInicialYP2 + auxP2
			aceleracaoP2 = Vector2(-aceleracaoXP2 * delta, aceleracaoYP2 * delta)
			$SettingsP2/Ball2.set_position(aceleracaoP2 + posKinematicP2)
			animP2.stop(false)
			
			if(lockP2 == true):
				posInicialP2 = Vector2(46, 0)
				posicaoBaseP2 = $SettingsP2/Player2.get_position()
				auxP2 = 0
				posInicialBolaP2 = posInicialP2 + posicaoBaseP2
				$SettingsP2/Ball2.set_position(posInicialBolaP2)
				animP2.play("ArmAnimation")
				
		if(anguloP2 >= 91 && anguloP2 <= 180):
			#anguloArremessoP2 = anguloArremessoP2 - 180
			anguloArremessoP2 = 90 - anguloArremessoP2
			conversaoRadAnguloArremessoP2 = deg2rad(-anguloArremessoP2)
			velocidadeInicialXP2 = velocidadeP2 * cos(conversaoRadAnguloArremessoP2)
			velocidadeInicialYP2 = velocidadeP2 * sin(conversaoRadAnguloArremessoP2)
			aceleracaoXP2 = velocidadeInicialXP2 * 3
			auxP2 += GRAVIDADE * delta
			aceleracaoYP2 = velocidadeInicialYP2 + auxP2
			aceleracaoP2 = Vector2(aceleracaoXP2 * delta, aceleracaoYP2 * delta)
			$SettingsP2/Ball2.set_position(aceleracaoP2 + posKinematicP2)
			#print("Pos x:", posXInicialP2, ", Pos y: ", posYInicialP2)
			animP2.stop(false)
			if(lockP2 == true):
				posInicialP2 = Vector2(46, 0)
				posicaoBaseP2 = $SettingsP2/Player2.get_position()
				auxP2 = 0
				posInicialBolaP2 = posInicialP2 + posicaoBaseP2
				$SettingsP2/Ball2.set_position(posInicialBolaP2)
				animP2.play("ArmAnimation")
			
		if(anguloP2 >= 181 && anguloP2 <= 270):
			#anguloArremessoP2 = 270 - anguloArremessoP2
			anguloArremessoP2 = 90 - anguloArremessoP2
			conversaoRadAnguloArremessoP2 = deg2rad(-anguloArremessoP2)
			velocidadeInicialXP2 = velocidadeP2 * cos(conversaoRadAnguloArremessoP2)
			velocidadeInicialYP2 = velocidadeP2 * sin(conversaoRadAnguloArremessoP2)
			aceleracaoXP2 = velocidadeInicialXP2 * 3#+ posXInicial
			auxP2 += GRAVIDADE * delta
			aceleracaoYP2 = velocidadeInicialYP2 + auxP2
			aceleracaoP2 = Vector2(aceleracaoXP2 * delta, aceleracaoYP2 * delta)
			$SettingsP2/Ball2.set_position(aceleracaoP2 + posKinematicP2)
			animP2.stop(false)
			if(lockP2 == true):
				posInicialP2 = Vector2(46, 0)
				posicaoBaseP2 = $SettingsP2/Player2.get_position()
				auxP2 = 0
				posInicialBolaP2 = posInicialP2 + posicaoBaseP2
				$SettingsP2/Ball2.set_position(posInicialBolaP2)
				animP2.play("ArmAnimation")
			
		if(anguloP2 >= 271 && anguloP2 <= 360):
			#anguloArremessoP2 = anguloArremessoP2 - 270
			anguloArremessoP2 = 90 - anguloArremessoP2
			conversaoRadAnguloArremessoP2 = deg2rad(-anguloArremessoP2)
			velocidadeInicialXP2 = velocidadeP2 * cos(conversaoRadAnguloArremessoP2)
			velocidadeInicialYP2 = velocidadeP2 * sin(conversaoRadAnguloArremessoP2)
			aceleracaoXP2 = velocidadeInicialXP2 * 3 #+ posXInicial
			auxP2 += GRAVIDADE * delta
			aceleracaoYP2 = velocidadeInicialYP2 + auxP2
			aceleracaoP2 = Vector2(aceleracaoXP2 * delta, aceleracaoYP2 * delta)
			$SettingsP2/Ball2.set_position(aceleracaoP2 + posKinematicP2)
			animP2.stop(false)
			if(lockP2 == true):
				posInicialP2 = Vector2(46, 0)
				posicaoBaseP2 = $SettingsP2/Player2.get_position()
				auxP2 = 0
				posInicialBolaP2 = posInicialP2 + posicaoBaseP2
				$SettingsP2/Ball2.set_position(posInicialBolaP2)
				animP2.play("ArmAnimation")
			
		var testeP2 = int($SettingsP2/AnimationPlayer/Sprite.rotation_degrees)
		
func isTrue():
	signalFlag = true
	lockP2 = false
	lock = true
	$Settings/AnimationPlayer/Sprite/AuxSprite.set_visible(true)
	$Settings/Ball1.set_visible(false)
	$SettingsP2/Player2/Camera2DP2.make_current()
	$HUD/LabelAngle2.set_visible(true)
	
func isTrueP2():
	signalFlagP2 = true
	lock = false
	lockP2 = true
	$SettingsP2/AnimationPlayer/Sprite/AuxSprite.set_visible(true)
	$SettingsP2/Ball2.set_visible(false)
	$Settings/Player/Camera2DP1.make_current()