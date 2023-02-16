extends Node2D

var car_scene = preload("res://scenes/fase 2/carro.tscn")
var car

func _ready():
	car = car_scene.instance()
	add_child(car)
	car.set_position(Vector2(205, 180))
	car.set_z_index(1)

func _process(delta):
	car.position.x -= 1
