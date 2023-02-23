extends KinematicBody2D

# Velocidade de movimento do personagem
var speed = 4000
# Define o movimento em 2 eixos
var move = Vector2()

func _ready():
	_process(true)

# Inicia a fsica do jogo
func _physics_process(delta):
	
	# Controles do personagem
	if Input.is_action_pressed("ui_right"):
		move.x = speed * delta
		$AnimationPlayer.play("andar para direita")
	elif Input.is_action_pressed("ui_left"):
		move.x = -speed * delta
		$AnimationPlayer.play("andar para esquerda")
	elif Input.is_action_pressed("ui_up"):
		move.y = -speed  * delta
		$AnimationPlayer.play("andar para frente")
	elif Input.is_action_pressed("ui_down"):
		move.y = speed  * delta
		$AnimationPlayer.play("andar para trás")
	else:
		move.x = 0
		move.y = 0
		$AnimationPlayer.stop()
		
	
	
	# Detecta colisões do personagem
#	move_and_slide(move)
	var collision = move_and_collide(move  * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		get_tree().reload_current_scene()

	
func _process(delta):
	pass


# Se o objeto toca a casa ele vence a fase 
func _on_casa_body_entered(body):
	get_tree().change_scene("res://Dialogos/dialogo_fase2_2.tscn")
