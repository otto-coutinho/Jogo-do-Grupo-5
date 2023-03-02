extends KinematicBody2D

var random = RandomNumberGenerator.new()
var num
# Called when the node enters the scene tree for the first time.


var andar = Vector2() #movimento
var velocidade = 20 #velocidade


func _ready():
	andar.y = 10
func _physics_process(delta):
	
	#var collision = move_and_collide(andar * delta)
	move_and_slide(andar)


	var collision = move_and_collide(andar * delta)
	var punch 
	
	if collision:
		num = random.randi_range(1, 4)
		punch = (collision.collider.name)
		if punch == "Person":
			get_tree().reload_current_scene()
			
		if num == 1:
			andar.y = 0
			andar.x = velocidade #direita
		elif num == 2:
			andar.y = 0
			andar.x = - velocidade #esquerda
		elif num == 3:
			andar.x = 0
			andar.y = velocidade #baixo
		elif num == 4:
			andar.x = 0
			andar.y = - velocidade #cima
