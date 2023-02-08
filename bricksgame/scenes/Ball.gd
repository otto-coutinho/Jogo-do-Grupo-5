extends RigidBody2D

const SPEEDUP = 400
const MAXSPEED = 30000

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies() # returns a array that contains all boddies that are colliding
	
	for body in bodies: # loops trough all of bodies that collading with and create a variable called body for each one
		if body.is_in_group("Bricks"): #cheak if the bodies that the ball collaied with is the bricks group
			body.queue_free() #destroy the brick that the ball touched
		
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length() # it gets the speed (the distace betwreeem the origin to the current postion of the vector
			var direction = get_position() - body.get_node("Ancor").get_global_position()
			var velocity = direction.normalized()*min(speed+SPEEDUP*delta, MAXSPEED*delta)
			set_linear_velocity(velocity)
			
	if get_position().y > get_viewport_rect().end.y: # if the ball goes outside the limits of the game it gets destroyed
		queue_free()
