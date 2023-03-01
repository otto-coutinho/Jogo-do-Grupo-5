extends KinematicBody2D

var random = RandomNumberGenerator.new()
var num
# Called when the node enters the scene tree for the first time.


var andar = Vector2() #movimento
var velocidade = 100 #velocidade

func _physics_process(delta):
	move_and_slide(andar)
	if andar.y == 0 and andar.x == 0:
		num = random.randi_range(1, 4)
		if num == 1:
			andar.x = velocidade #direita
		if num == 2:
			andar.x = - velocidade #esquerda
		if num == 3:
			andar.y = velocidade #baixo
		if num == 4:
			andar.y = - velocidade #cima
	
#	if collision:
#		print("I collided with ", collision.collider.name)
#

