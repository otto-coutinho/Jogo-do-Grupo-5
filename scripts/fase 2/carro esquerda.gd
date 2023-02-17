extends KinematicBody2D

var speed = 100
var temp = randf()

func _ready():
	set_position(Vector2(205, 185))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)

# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	position.x -= 2
