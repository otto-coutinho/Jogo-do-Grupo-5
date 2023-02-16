extends KinematicBody2D

# Velocidade de movimento do personagem
var speed = 9000 * 0.9
# Define o movimento em 2 eixos
var move = Vector2()

# Inicia a fsica do jogo
func _physics_process(delta):
	
	# Controles do personagem
	if Input.is_action_pressed("ui_right"):
		move.x = speed * delta
	elif Input.is_action_pressed("ui_left"):
		move.x = -speed * delta
	elif Input.is_action_pressed("ui_up"):
		move.y = -speed  * delta
	elif Input.is_action_pressed("ui_down"):
		move.y = speed  * delta
	else:
		move.x = 0
		move.y = 0

	# Detecta colisões do personagem
	move_and_slide(move)
	var collision = move_and_collide(move * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		get_tree().reload_current_scene()
	
func _process(delta):
		# Bloqueia o movimento do personagem além dos limites da tela
		if position.x < -get_viewport().size.x:
			position.x = get_viewport().size.x
		if position.y > (get_viewport().size.y) - 30:
			position.y = 610
		elif position.y == 30:
			position.y = 30
			

# Se o objeto toca a casa ele vence a fase 
func _on_casa_body_entered(body):
	get_tree().change_scene("res://scenes/pergunta2.tscn")
