extends KinematicBody2D

var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(67,350))
	set_z_index(1)
func _physics_process(delta):
	
	if position.x == 67:
		move.x = + speed
	if position.x == 67+ 80:
		move.x = - speed
	if position.y == 350:
		move.y = speed
	if position.y == 350+80:
		move.y = - speed

	move_and_slide(move)
	
	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
