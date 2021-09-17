extends Area2D

export var value = 10

func _process(delta):
	rotation_degrees += 90 * delta


func _on_PhilosoperStone_body_entered(body):
	
	if body.name == "mainPlayer":
		body.collect_stone(value)
		queue_free()
