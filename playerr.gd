extends KinematicBody2D

export (float) var speed = 300

var motion = Vector2.ZERO

func _physics_process (delta):

	if Input. is_action_pressed("ui_right"):
		$AnimatedSprite.play("Correr derecha")
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("Correr izquierda")
		motion.x =-speed
		motion.y = 0
	elif Input.is_action_pressed("ui_select"):
		$AnimatedSprite.play("Salto derecha")
		motion.y = -speed
		motion.x = 0
	elif Input.is_action_pressed("golpe"):
		$AnimatedSprite.play("Ataque 1 ")	
	else: 
		$AnimatedSprite.play("Idle derecha")
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)
	
	motion = Vector2(motion.x, motion.y)* speed


	
