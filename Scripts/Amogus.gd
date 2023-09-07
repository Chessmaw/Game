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
var disparando 
#Songs

func _physics_process (delta):
	
	state_machine_pistola = $AmogusSpritesheet2/Pistolaamogus/animatreepistola.get("parameters/playback")
	$AmogusSpritesheet2/Pistolaamogus/animatreepistola.set_active(true)
	animacion = $AnimationPlayer.get_current_animation()
	$AnimationTree.set_active(true)
	state_machine = $AnimationTree.get("parameters/playback")
	Motion.y += Gravity
#Movimiento
	if Input.is_action_pressed("ui_left"):
		Motion.x = -Speed
		$AmogusSpritesheet2.flip_h = true
		state_machine.travel('Caminar')
		$AmogusSpritesheet2/Pistolaamogus.offset =  Vector2 (-11, 0)
		$AmogusSpritesheet2/Pistolaamogus.flip_h = true
		
	elif Input.is_action_pressed("ui_right"):
		Motion.x = Speed
		$AmogusSpritesheet2.flip_h = false
		state_machine.travel('Caminar')
		$AmogusSpritesheet2/Pistolaamogus.offset =  Vector2 (11, 0)
		$AmogusSpritesheet2/Pistolaamogus.flip_h = false
		
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
	if Input.is_action_pressed("desenfunde"):
		$AmogusSpritesheet2/Pistolaamogus.show()
		state_machine_pistola.travel("sacarsela")
			
	if Input.is_action_pressed("Disparar"):
		$AmogusSpritesheet2/Pistolaamogus/animparapsitola.play("Disparar")
		
	Motion = move_and_slide(Motion, UP)
# Vida Test
func _on_Area2D_body_entered(body):
		Globalvariables.player_health = 100
		Globalvariables.player_lives -= 1
		
func comprobar_estado_de_ataque():
	if disparando == 0:
		state_machine_pistola.travel("idlepistolon")
		
func _on_animparapsitola_animation_finished(Disparar):
	$AmogusSpritesheet2/Pistolaamogus/animparapsitola.play("idlepistolon")

