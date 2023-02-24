extends Node2D

# Carrega a cena que está o carro
var car_scene = preload("res://scenes/fase 2/carro.tscn")
var car

var car_scene_2 = preload("res://scenes/fase 2/carro2.tscn")
var car2

var car_scene_3 = preload("res://scenes/fase 2/carro3.tscn")
var car3

var car_scene_4 = preload("res://scenes/fase 2/carro4.tscn")
var car4

var car_scene_5 = preload("res://scenes/fase 2/carro5.tscn")
var car5

var timer_limit = 1000

var random1 = 1
var random2 = 1
var random3 = 2
var random4 = 2
var random5 = 2

# Create a timer node
var timer = Timer.new()
var timer2 = Timer.new()
var timer3 = Timer.new()
var timer4 = Timer.new()
var timer5 = Timer.new()

func _ready():
	
	# Set it as repeat
	timer.set_one_shot(false)
	timer2.set_one_shot(false)
	timer3.set_one_shot(false)
	timer4.set_one_shot(false)
	timer5.set_one_shot(false)

	# Connect its timeout signal to the function you want to repeat
	timer.connect("timeout", self, "car_spaw_1")
	timer2.connect("timeout", self, "car_spaw_2")
	timer3.connect("timeout", self, "car_spaw_3")
	timer4.connect("timeout", self, "car_spaw_4")
	timer5.connect("timeout", self, "car_spaw_5")
	
	# Add to the tree as child of the current node
	add_child(timer)
	timer.start()
	
	add_child(timer2)
	timer2.start()
	
	add_child(timer3)
	timer3.start()
	
	add_child(timer4)
	timer4.start()
	
	add_child(timer4)
	timer5.start()

# Faz a instancia da cena do carro nessa cena
func car_spaw_1():
	car = car_scene.instance()
	add_child(car)
	
	random1 = rand_range(3, 5)
	
	# Set timer interval
	timer.set_wait_time(random1)

func car_spaw_2():
	car2 = car_scene_2.instance()
	add_child(car2)
	
	random2 = rand_range(3, 5)
	
	# Set timer interval
	timer2.set_wait_time(random2)

func car_spaw_3():
	car3 = car_scene_3.instance()
	add_child(car3)

	random3 = rand_range(3, 5)

	# Set timer interval
	timer3.set_wait_time(random3)
	
func car_spaw_4():
	car4 = car_scene_4.instance()
	add_child(car4)
	
	random4 = rand_range(3, 5)
	
	# Set timer interval
	timer4.set_wait_time(random4)

#func car_spaw_5():
#	car5 = car_scene_5.instance()
#	add_child(car5)
#
#	random5 = rand_range(5, 7)
#
#	# Set timer interval
#	timer5.set_wait_time(random5)

func _process(delta):
	# Bloqueia o movimento do personagem além dos limites da tela
	if $mapa/Personagem.position.x > 360 or $mapa/Personagem.position.x == 0 or $mapa/Personagem.position.y == 0 or $mapa/Personagem.position.y == 640:
		 $mapa/Personagem.set_position(Vector2(180, 610))
