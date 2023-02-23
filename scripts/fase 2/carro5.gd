extends KinematicBody2D

var speed = 100
var temp = randf()
var move = Vector2()

var pos = [-10, 70, 4, 5, 6]

func _ready():
	set_position(Vector2(250, -110))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)
	var aleatorio = pos[randi() % pos.size()]
	print(aleatorio)
	

#func _physics_process(delta):
#	var collision = move_and_collide(move)
#
#	# Se houver uma colisão a cena reinicia
#	if collision:
#		get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	position.x -= 140 * delta
