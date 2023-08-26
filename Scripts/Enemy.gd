extends KinematicBody2D


var grabity= 10
var speed = 70
var velocity = Vector2(0,0)
# Player Running Animation
func _ready():
	$AnimationPlayer.play("Correr_derecha")
	pass
# This happenns if the enemy dies
func _process(delta):
	# If it reaches zero disappears
	if Globalvariables.EnemyHealt == 0:
		$AnimationPlayer.play("Daño_der")
	elif Globalvariables.EnemyHealt <= -10:
		Globalvariables.EnemyHealt = 100
		queue_free()
	elif Globalvariables.EnemyHealt > 1:
		velocity.y +=grabity
		velocity.x = -speed
		velocity = move_and_slide(velocity,Vector2.UP)
		pass
		#queue_free() # -> disappears
	# We can put an animation of dying of the enemy

	move_character()
#Physical
func move_character():
	pass


func _on_Area2D_body_entered(body):

	if body.name == "Player":
		# Enemy Damange
		Globalvariables.EnemyHealt -= 11
		Globalvariables.player_health -= 25 
		if true:
			$AnimationPlayer.play("Ataque1_derecha")
		# Life of the player if it changes and animation.
		if Globalvariables.player_health <= Globalvariables.player_health:
			print("Player Healt :" , Globalvariables.player_health)
		
		# Player Died --> 0 
		if Globalvariables.player_health == 0:
			# we can put the dead animation player here
			print("Player Healt :0 \n","You died")
			get_tree().reload_current_scene()
			# Renew life --> 100 full life , If it reached zero
			if true:
				Globalvariables.player_health = 100
	pass
