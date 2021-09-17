extends KinematicBody2D

var score : int = 0
var speed : int = 200
var jumpForce : int = 500
var gravity : int = 800

export var stoneLeft = 11

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Edward_sprite")
onready var spritePrize : Sprite = get_tree().get_root().get_node("/root/MainScene/Prize/Prize")
onready var spriteGate : StaticBody2D = get_node("/root/MainScene/Gate")
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

func _physics_process(delta):
	
	vel.x = 0
	
	#to move left or right
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	#applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity * delta
	
	#jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	#to flip the player
	if vel.x < 0:
		sprite.flip_h = false
	elif vel.x > 0:
		sprite.flip_h = true
		

#if player die
func die() :
	get_tree().reload_current_scene()
	
#when collect stone
func collect_stone(value) :
	score += value
	stoneLeft -= 1
	ui.set_score_text(score)	
	
	if stoneLeft < 1:
		spriteGate.queue_free()
		spritePrize.visible = true
		
	
#collect prize
func collect_prize():
	get_tree().reload_current_scene()

