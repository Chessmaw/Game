extends KinematicBody2D


var grabity= 10
var speed = 70
var velocity = Vector2(0,0)
var attackDamage : int = 10
var attackCooldown : float = 1.0
var canAttack : bool = true

func _ready():

	$AnimationPlayer.play("Correr_izquierda")
func _process(delta):
	if Globalvariables.EnemyHealt == 0:
		queue_free()
	move_character()
	

func move_character():
	
	velocity.y +=grabity
	velocity.x = -speed
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_Area2D_body_entered(body):
	print("Estoy tocando")
	print(Globalvariables.player_health)
	if body.name == "Player":
		if true:
			$AnimationPlayer.play("Ataque1_izquierda")
		elif false:
			$AnimationPlayer.play("Correr_izquierda")
		Globalvariables.player_health -= 25 # Enemy Damange
		if Globalvariables.player_health == 0:
			#Podemos Poner la animacion de morir aqui
			get_tree().reload_current_scene()
			if true:
				Globalvariables.player_health = 100
				
		#get_tree().reload_current_scene()
	pass 



	
