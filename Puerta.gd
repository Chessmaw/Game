extends Area2D




func _on_Area2D_input_event(viewport, event, shape_idx):
	Input.is_action_pressed("ui_up")
	get_tree().change_scene("res://Escenas/adentro de la cafe.tscn")
