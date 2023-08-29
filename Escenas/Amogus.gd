extends KinematicBody2D

# Variables
export (float)var Gravity = 20
export (float)var Speed = 150
var Motion = Vector2()
var UP = Vector2(0, -1)
export (float)var jumpforce = 400
var state_machine
var animacion
var state_machine_pistola
#Songs

func _physics_process (delta):
	state_machine_pistola = $animatreepistola.get("parameters/playback")
	$animatreepistola.set_active(true)
	animacion = $AnimationPlayer.get_current_animation()
	$AnimationTree.set_active(true)
	state_machine = $AnimationTree.get("parameters/playback")
	Motion.y += Gravity
		#Movimiento
	if Input.is_action_pressed("ui_left"):
		Motion.x = -Speed
		$AmogusSpritesheet2.flip_h = true
		state_machine.travel('Caminar')
	elif Input.is_action_pressed("ui_right"):
		Motion.x = Speed
		$AmogusSpritesheet2.flip_h = false
		state_machine.travel('Caminar')
	else:
		Motion.x = 0
		state_machine.travel('Idle')
		#Salto
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			Motion.y = -jumpforce
			
	else:
		if Motion.y >= 0:
			state_machine.travel("Caer")
		else:
			state_machine.travel("saltar")
	# Enemy life -1 
	if is_on_floor():
		if $Pistolaamogusdesenfunde.show() == (true):
			if Input.is_action_pressed("desenfunde"):
				$Pistolaamogusdesenfunde.show()
				$desenfunde.play('Sacarsela')
				if Input.is_action_pressed("Disparar"):
					$Pistolaamogus.show()
					$animparapsitola.play("disparar")
			else:
				$desenfunde.play_backwards('Sacarsela')
	Motion = move_and_slide(Motion, UP)

# Vida Test
func _on_Area2D_body_entered(body):
		Globalvariables.player_health = 100
		Globalvariables.player_lives -= 1
