extends Node2D

# Carrega a cena que está o carro
var car_scene = preload("res://scenes/fase 2/carro.tscn")
var car

var car_scene_2 = preload("res://scenes/fase 2/carro2.tscn")
var car2

var car_scene_3 = preload("res://scenes/fase 2/carro3.tscn")
var car3

var timer_limit = 1000

var random1 = 2
var random2 = 2
var random3 = 2

# Create a timer node
var timer = Timer.new()

func _ready():
	# Set it as repeat
	timer.set_one_shot(false)

	# Connect its timeout signal to the function you want to repeat
	timer.connect("timeout", self, "car_spaw_1")
	timer.connect("timeout", self, "car_spaw_2")
	timer.connect("timeout", self, "car_spaw_3")
	
	# Add to the tree as child of the current node
	add_child(timer)

	timer.start()

# Faz a instancia da cena do carro nessa cena
func car_spaw_1():
	car = car_scene.instance()
	add_child(car)
	
	random1 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random1)

func car_spaw_2():
	car2 = car_scene_3.instance()
	add_child(car3)
	
	random2 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random2)

func car_spaw_3():
	car3 = car_scene_2.instance()
	add_child(car2)
	
	random3 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random3)

# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	pass
