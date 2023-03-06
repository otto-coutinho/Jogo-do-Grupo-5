extends KinematicBody2D

var move = Vector2()
var speed = 5000
var bateu

var keyCard = [0]
	
func _process(delta):
	# A cada keycard pega em um posição ela muda
	if keyCard == [1]:
		get_node("../key/key").position = Vector2(271, 429)
#		get_node("../key/KeyCheck").visible = true
	if keyCard == [2]:
		get_node("../key/key").position = Vector2(268, 190)
	if keyCard == [3]:
		get_node("../key/key").visible = false
		get_node("../key/key").position = Vector2(560, 381)

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		move.y = - speed * delta
	elif Input.is_action_pressed("ui_down"):
		move.y = speed * delta
	elif Input.is_action_pressed("ui_right"):
		move.x = speed * delta
	elif Input.is_action_pressed("ui_left"):
		move.x = - speed * delta
	else:
		move.x = 0
		move.y = 0
	
	move_and_slide(move)

	var collision = move_and_collide(move * delta)
	var checkCollision = ['parede1','parede2','parede3','parede4','parede5','parede6','parede7','parede8','parede9','parede10', 'parede11','parede12','parede13','parede14','key']
	
	if collision:
		bateu = collision.collider.name
		if bateu == 'key':
			# Adiciona +1 ao valor anterior
			keyCard[0] += 1
			print(keyCard)

		elif !(bateu in checkCollision):
			get_tree().reload_current_scene()
			print(bateu)
	

# Quando o player chega no lugar
func _on_Compliance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if keyCard == [3]:
		print("Deu certo caralho")
		# Jogador vence o jogo quando coletar as 3 chaves e recebe mais um ponto na variável global
		if Points.whg == false:
			Points.addpoint()
			Points.whg = true
		get_tree().change_scene("res://Dialogos/dialogo_fase1_2.tscn")
	else: 
		print("Folgado, vai pegar a key")

# Quando o jogador vai para o lugar errado
func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("ruinzão")
