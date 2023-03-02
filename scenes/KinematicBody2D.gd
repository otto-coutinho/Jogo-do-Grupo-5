extends KinematicBody2D

var andar = Vector2() #movimento
var velocidade = 125 #velocidade
var cima = false
var baixo = false

var point = [0]
var point2 = [0]
var point3 = [0]
var point4 = [0]

var collision = move_and_collide(andar)
var punch

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
	
func _process(delta):
	
	var win = point[0] + point2[0] + point3[0] + point4[0]
	if win == 4:
		print("é")
		get_node("../win/firework").play("run")
		get_node("../win/firework2").play("run")
		get_node("../win/firework3").play("run")
		get_node("../win/firework4").play("run")
		get_node("../win/firework5").play("run")

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
	
	if collision:
		punch = (collision.collider.name)
		if punch == "spriteCerveja":
			get_tree().reload_current_scene()


func _on_Capacete_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete").visible = false
		point = [1]


func _on_Capacete2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete2").visible = false
		point2 = [1]


func _on_Capacete3_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete3").visible = false
		point3 = [1]


func _on_Capacete4_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete4").visible = false
		point4 = [1]

