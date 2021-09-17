extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

onready var sprite : Sprite = get_node("Enemy")

func _physics_process(delta):
	
	#move to targetX
	position.x = move_toward(position.x, targetX, speed * delta)
	
	#change directions 
	if position.x == targetX:
		if position.x == startX:
			targetX = position.x + moveDist
			sprite.flip_h = true
		else:
			targetX = startX
			sprite.flip_h = false	
			

func _on_Enemy_body_entered(body):
		
	if body.name == "mainPlayer":
		body.die()
		

