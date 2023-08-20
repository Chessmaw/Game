extends KinematicBody2D


var grabity= 10
var speed = 70
var velocity = Vector2(0,0)
var attackDamage : int = 10
var attackCooldown : float = 1.0
var canAttack : bool = true

func _ready():
	#Poner animaciones exaple : 	$AnimationPlayer.play("walk")

	pass # Replace with function body.

func _process(delta):
	move_character()

func move_character():
	velocity.y +=grabity
	velocity.x = -speed

	velocity = move_and_slide(velocity,Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		
		print("Me mori")
		get_tree().reload_current_scene()
	pass # Replace with function body.



	
