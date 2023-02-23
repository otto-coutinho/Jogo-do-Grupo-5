extends KinematicBody2D

var speed = 100
var temp = randf()
var move = Vector2()


func _ready():
	set_position(Vector2(-250, 220))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)

#func _physics_process(delta):
#	var collision = move_and_collide(move)
#
#	# Se houver uma colisão a cena reinicia
#	if collision:
#		get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	position.x += 140 * delta
