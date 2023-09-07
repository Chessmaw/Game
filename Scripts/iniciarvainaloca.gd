extends Area2D

	

func _on_Area2D_body_entered(body):
	$"../KinematicBody2D/ElTaquero2".show()
	$"../AnimatedSprite".show()
	$"../AnimatedSprite/AnimationPlayer".play("aparecer")
	$"../KinematicBody2D/ElTaquero2/AnimationPlayer".play("Aparecer")
	$"../AudioStreamPlayer/AnimationPlayer".play("aasfgfqadcsx")
	$"../AudioStreamPlayer".play()
	$"../AnimatedSprite".play("default")
	$CollisionShape2D.set_position(Vector2(-1000,-1000))
func _on_AnimatedSprite_animation_finished():
	$"../Label/AnimationPlayer".play("aparecerrr")
	$"../Label".show()
