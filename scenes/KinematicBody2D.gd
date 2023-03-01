extends KinematicBody2D

func _ready():
	pass # Replace with function body.


var andar = Vector2() #movimento
var velocidade = 125 #velocidade
var cima = false
var baixo = false

# touch para movimentar:
var esquerda = false
var direita = false 
func _on_Cima_pressed():
	cima = true
func _on_Baixo_pressed():
	baixo = true
func _on_Direita_pressed():
	direita = true
func _on_Esquerda_pressed():
	esquerda = true

func _physics_process(delta):
	move_and_slide(andar)
	if Input.is_action_just_pressed("ui_down") or baixo:
		andar.y = velocidade
		andar.x = 0
		baixo = false
	if Input.is_action_just_pressed("ui_up") or cima:
		andar.y = -velocidade
		andar.x = 0
		cima = false
	if Input.is_action_just_pressed("ui_right") or direita:
		andar.x = velocidade
		andar.y = 0
		direita = false
	if Input.is_action_just_pressed("ui_left") or esquerda:
		andar.x = -velocidade
		andar.y = 0
		esquerda = false


