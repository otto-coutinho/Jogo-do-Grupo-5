extends KinematicBody2D

var move = Vector2()
var speed = 5000
var bateu

var keyCard = []
	
func _process(delta):
	
	if keyCard == [1]:
		get_node("../key/key").position.x = 1000
		get_node("../key/key").position.y = 1000

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
	var checkCollision = ['parede1','parede2','parede3','parede4','parede5','parede6','parede7','parede8','parede9','parede10', 'parede11','key']
	
	if collision:
		bateu = collision.collider.name
		if bateu == 'key':
			keyCard.append(1)
			print(keyCard)

		elif !(bateu in checkCollision):
			get_tree().reload_current_scene()
	

func _on_Compliance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if keyCard == [1]:
		print("Deu certo caralho")


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("ruinzão")
