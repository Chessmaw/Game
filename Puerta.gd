extends Area2D

export (String) var escena

func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		if Input.is_action_pressed("ui_select"):
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Escenas/"+escena+".tscn")
		
