extends KinematicBody2D

var speed = 9000 * 0.9
#velocidade de movimento do personagem
var move = Vector2()
#define o movimento em 2 eixos

func _physics_process(delta):
#da inicio a fsica do jogo
	
	#controles do personagem
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

	move_and_slide(move)
	
	var collision = move_and_collide(move * delta)
	
	if collision:
		get_tree().reload_current_scene()
	
func _process(delta):
		if position.x < -get_viewport().size.x:
			position.x = get_viewport().size.x
		if position.y > (get_viewport().size.y) - 30:
			position.y = 610
		elif position.y == 30:
			position.y = 30
		
func _on_casa_body_entered(body):
	get_tree().change_scene("res://scenes/pergunta2.tscn")
