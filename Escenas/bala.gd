extends RigidBody2D


var velocity = Vector2(500, 0)  # Velocidad inicial de la bala (ajusta según tus necesidades).

func _ready():
	pass  # Puedes hacer configuraciones adicionales aquí si es necesario.

func _physics_process(delta):
	# Mueve la bala en la dirección de la velocidad.
	var motion = velocity * delta
	

func _on_Bullet_body_entered(body):
	# Cuando la bala colisiona con algo, elimina la bala.
	queue_free()
