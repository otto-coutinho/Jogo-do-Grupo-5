extends KinematicBody2D

var speed = 100
var temp = randf()

func _ready():
	set_physics_process(true)

# Físicas do carro do jogo crossing road
func _physics_process(delta):
	pass
