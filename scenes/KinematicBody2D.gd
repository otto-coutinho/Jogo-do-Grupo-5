extends KinematicBody2D

func _ready():
	pass # Replace with function body.

#	pass
var andar = Vector2()
var velocidade = 150

	
func _physics_process(delta):
	move_and_slide(andar)
	if Input.is_action_just_pressed("ui_down"):
		andar.y = velocidade
		andar.x = 0
	if Input.is_action_just_pressed("ui_up"):
		andar.y = -velocidade
		andar.x = 0
	if Input.is_action_just_pressed("ui_right"):
		andar.x = velocidade
		andar.y = 0
	if Input.is_action_just_pressed("ui_left"):
		andar.x = -velocidade
		andar.y = 0
