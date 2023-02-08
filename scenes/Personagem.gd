extends KinematicBody2D

var speed = 200
#velocidade de movimento do personagem
var move = Vector2()
#define o movimento em 2 eixos

func _physics_process(delta):
#da inicio a fsica do jogo
	
	#controles do personagem
	if Input.is_action_pressed("ui_right"):
		move.x = speed
	elif Input.is_action_pressed("ui_left"):
		move.x = -speed
	elif Input.is_action_pressed("ui_up"):
		move.y = -speed
	elif Input.is_action_pressed("ui_down"):
		move.y = speed
	else:
		move.x = 0
		move.y = 0

	move_and_slide(move)


func _on_Area2D_area_entered(area):
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://scenes/pergunta2.tscn")
