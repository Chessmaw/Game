extends KinematicBody2D

# Variables
export (float)var Gravity = 20
export (float)var Speed = 150
var Motion = Vector2()
var UP = Vector2(0, -1)
export (float)var jumpforce = 400
var state_machine
var animacion

#Songs
onready var Hit = $Ataquelink
onready var Drop = $Caida
onready var leap = $salto
func _physics_process (delta):
	animacion = $AnimationPlayer.get_current_animation()
	$AnimationTree.set_active(true)
	state_machine = $AnimationTree.get("parameters/playback")
	Motion.y += Gravity
		#Movimiento
	if Input.is_action_pressed("ui_left"):
		Motion.x = -Speed
		$Sprite.flip_h = true
		state_machine.travel('Correr_derecha')
	elif Input.is_action_pressed("ui_right"):
		Motion.x = Speed
		$Sprite.flip_h = false
		state_machine.travel('Correr_derecha')
	else:
		Motion.x = 0
		state_machine.travel('Idle_derecha')
		#Salto
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			Motion.y = -jumpforce
			leap.play()
	else:
		if Motion.y >= 0:
			state_machine.travel("Caer_der")
		else:
			state_machine.travel("Salto_derecha")
	# Enemy life -1 
	if is_on_floor():
		if Input.is_action_pressed("golpe"):
			Hit.play()
			state_machine.travel('Ataque1_derecha') 
			Globalvariables.EnemyHealt -= 1 
			Motion.x = 0
	Motion = move_and_slide(Motion, UP)

# Vida Test
func _on_Area2D_body_entered(body):
		Globalvariables.player_health = 100
		Globalvariables.player_lives -= 1
