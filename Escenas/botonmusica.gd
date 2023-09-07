extends Button



func _on_botonmusica_pressed():
	$"musica chistosa".play()
	$".".hide()
	$"../pararmusicachistosa".show()
	$"../AnimatedSprite2".show()
	$"../AnimatedSprite2".play("default")
	$"../AudioStreamPlayer".stream_paused = true
	
func _on_pararmusicachistosa_pressed():
	$".".show()
	$"musica chistosa".stop()
	$"../pararmusicachistosa".hide()
	$"../AnimatedSprite2".hide()
	$"../AudioStreamPlayer".stream_paused = false
