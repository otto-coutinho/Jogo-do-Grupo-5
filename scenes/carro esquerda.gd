extends KinematicBody2D

var speed = 10/3
var temp = randf()


func _process(delta):
	position.x = position.x - speed
	
	if position.x < -get_viewport().size.x:
		yield(get_tree().create_timer(temp), "timeout")
		position.x = 380
		
		
