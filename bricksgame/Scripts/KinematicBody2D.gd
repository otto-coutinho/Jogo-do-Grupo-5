extends KinematicBody2D

const ball_scene = preload("res://bricksgame/Mini scenes/ball_scene.tscn")

func _ready():
	set_physics_process(true) # run a physics process everry single physics step
	set_process_input(true)
	
#func set_physics_process(_delta):
#	var y = get_position().y
#	var position_x = get_position().x
#	var mouse_x = get_global_mouse_position().x
#	if position_x != mouse_x:
#		set_position(Vector2(mouse_x, y))

func _physics_process(_dt: float) -> void:
	var new_position = position
	if position != get_global_mouse_position():
		position.y = 300
		new_position = lerp(position, get_global_mouse_position(), .1)
	move_and_collide(new_position - position)
#		get_tree().reload_current_scene()
#https://godotengine.org/qa/119099/make-player-follow-mouse-while-still-colliding-with-objects

func _input(event):
	if event is InputEventMouseButton: # if the event is a button pressed
		var ball = ball_scene.instance() # instace the the scene from the ball and add to the ball variable
		ball.set_position(get_position()-Vector2(0,16)) # the ball will spawn a little bit above the paddle
		get_tree().get_root().add_child(ball) # add the ball scene to the tree of this scene
