extends KinematicBody2D

var speed = 100
var temp = randf()

func _ready():
	set_physics_process(true)


func _physics_process(delta):
	pass


#func _on_Area2D_body_entered(body):
#	get_tree().reload_current_scene()
