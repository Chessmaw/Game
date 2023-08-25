extends KinematicBody2D


var grabity= 10
var speed = 70
var velocity = Vector2(0,0)
var attackDamage : int = 10
var attackCooldown : float = 1.0
var canAttack : bool = true


func _process(delta):
	move_character()

func move_character():
	velocity.y +=grabity
	velocity.x = -speed

	velocity = move_and_slide(velocity,Vector2.UP)


func _on_Area2D_body_entered(body):
	print("Estoy tocando")
	print(Globalvariables.player_health)
	if body.name == "Player":
		Globalvariables.player_health -= 10
		if Globalvariables.player_health == 0:
			get_tree().reload_current_scene()
			if true:
				Globalvariables.player_health = 100
				
		#get_tree().reload_current_scene()
	pass 



	
