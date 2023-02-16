extends Node2D

# Carrega a cena que está o carro
var car_scene = preload("res://scenes/fase 2/carro.tscn")
var car

func _ready():
	# Faz a instancia da cena do carro nessa cena
	car = car_scene.instance()
	add_child(car)
	# Define a posição do carro
	car.set_position(Vector2(205, 180))
	# Coloca a sprite do carro acima das outras
	car.set_z_index(1)

# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	car.position.x -= 1
