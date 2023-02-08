extends KinematicBody2D

var speed = 200
var move = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		move.x = speed
	elif Input.is_action_pressed("ui_left"):
		move.x = -speed
	elif Input.is_action_pressed("ui_up"):
		move.y = -speed
	elif Input.is_action_pressed("ui_down"):
		move.y = speed
	else:
		move.x = 0
		move.y = 0

	move_and_slide(move)
