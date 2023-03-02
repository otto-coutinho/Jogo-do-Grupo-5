extends KinematicBody2D

var move = Vector2()
var speed = 30

func _ready():
	set_position(Vector2(270,290))
	set_z_index(1)
	

func _physics_process(delta):
	
	if position.x == 270:
		move.x = - speed
	if position.x == 84:
		move.x = speed
	if position.y == 290:
		move.y = -15
	if position.y == 260:
		move.y = +15

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
