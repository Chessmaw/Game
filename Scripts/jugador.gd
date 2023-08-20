extends KinematicBody2D
export (float) var life= 100
export (float) var SPEED = 200  
export (float) var GRAVITY = 800  
export (float) var JUMP_FORCE = -400  
var state_machine
var velocity = Vector2()  

func _physics_process(delta):
	
	state_machine = $AnimationTree.get("parameters/playback")
	
	var move_direction = Vector2.ZERO
	move_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity.x = move_direction.x * SPEED
	
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_FORCE



		var maxHealth := 100
		var currentHealth := maxHealth
		

		func takeDamage():
			currentHealth -= 4  # Se le resta 4 puntos de vida
			if currentHealth <= 0:
				currentHealth = 0
				die()
		
		func heal(healAmount: int):
			currentHealth += healAmount
			if currentHealth > maxHealth:
				currentHealth = maxHealth
		
		func die():
			# Aquí puedes poner la lógica para cuando el jugador muere
			queue_free()


