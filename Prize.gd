extends Area2D

onready var sprite : Sprite = get_node("Prize")

func _ready():
	sprite.visible = false

func _on_Prize_body_entered(body):
	
	if body.name == "mainPlayer":
		body.collect_prize()
		queue_free()
