extends KinematicBody2D

var move = Vector2()
var speed = 30

func _ready():
	set_position(Vector2(262,374))
	set_z_index(1)
func _physics_process(delta):
	
	if position.x == 262:
		move.x = - speed
	if position.x == 180:
		move.x = speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
