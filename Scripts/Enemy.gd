extends KinematicBody2D

var gravity = 10
var speed = 50
var velocity = Vector2(0, 0)
onready var Died = $Muerte
func _ready():
	$AnimationPlayer.play("Correr_derecha")

func _process(delta):
	if Globalvariables.EnemyHealt == 0:
		Died.play()
		$AnimationPlayer.play("Daño_der")
	elif Globalvariables.EnemyHealt <= -10:
		Globalvariables.EnemyHealt = 100
		queue_free()
	elif Globalvariables.EnemyHealt > 1:
		velocity.y += gravity
		velocity = move_and_slide(velocity, Vector2.UP)

	move_character()

func move_character():
	velocity.x = -speed
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_body_entered(body):
	if body.name == "Colision":
		scale.x = -scale.x
		speed = -speed
		$AnimationPlayer.play("Correr_derecha")

	if body.name == "Player":
		Globalvariables.EnemyHealt -= 11
		Globalvariables.player_health -= 25
		$AnimationPlayer.play("Ataque1_derecha")

		if Globalvariables.player_health <= 0:
			print("Player Health:0 \n", "You died")
			Globalvariables.player_health = 100
			Globalvariables.EnemyHealt = 100
			get_tree().reload_current_scene()

		print("Player Health:", Globalvariables.player_health)
