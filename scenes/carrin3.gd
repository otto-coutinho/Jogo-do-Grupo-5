extends Area2D

var speed = 100

func _process(delta):
	position. x -= speed * delta 
	
	if position. x < 0:
		position. x = get_viewport().size.x
