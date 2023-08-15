extends KinematicBody2D

export (float) var SPEED = 200  
export (float) var GRAVITY = 800  
export (float) var JUMP_FORCE = -400  

var velocity = Vector2()  

func _physics_process(delta):
	var move_direction = Vector2.ZERO
	move_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity.x = move_direction.x * SPEED
	
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_FORCE
