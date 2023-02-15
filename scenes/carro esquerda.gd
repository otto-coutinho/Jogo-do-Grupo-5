extends KinematicBody2D

var speed = 250
var temp = randf()


func _process(delta):
	position.x = position.x - speed  * delta
	
	if position.x < -get_viewport().size.x:
		yield(get_tree().create_timer(temp), "timeout")
		position.x = 400


func _on_Area2D_body_entered(body):
	get_tree().reload_current_scene()
