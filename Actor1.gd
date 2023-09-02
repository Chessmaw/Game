extends KinematicBody2D

var speed = 1.8

func _physics_process(delta):
	# Mueve al personaje hacia la derecha
	move_and_collide(Vector2(1, 0) * speed)
	
func _on_Area2D_area_entered(area):
	$caminandointro.hide()
	$"../Area2D".hide()
	$"../Linkintro22".play("default")
	$"../Linkintro22".show()
	$"../AnimationPlayer".play("Disolve")
	$"../ColorRect".show()
	
	
func _on_Linkintro22_animation_finished():
	$"../AnimatedSprite".show()
	$"../Trifuerza2".show()
	$"../Linkintro22".hide()


func _on_AnimationPlayer_animation_finished(Disolve):
	$"../lkesgo".play("dejar")
	$"../AudioStreamPlayer".play()
	$"../muscia".play("asdf")
	$"../el del titulo".play("Aparicion")
	$"../Blue Label de yoni walker".show()
	
func _on_lkesgo_animation_finished(dejar):
	$"../asdsdfg".play("ayyda")
	
func _on_el_del_titulo_animation_finished(anim_name):
	$"../Button".show()
	$"../delboton".play("aparecer")
	$"../Label".show()

func _on_delboton_animation_finished(aparecer):
	$"../delboton".play("rgb")


func _on_area_de_los_pasos_area_entered(area):
	$AudioStreamPlayer.play()
