extends KinematicBody2D

export var speed = 400
var velocity = Vector2.ZERO

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-.8, .8][randi() % 2]
	
func _physics_process(delta):
	# delta is the time between func process runs
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)*1.04
		$CollisionSound.play()
	if global_position.y < 16 or global_position.y > 599:
		velocity.y *= -1
	# TO DO: Have ball stop until players are ready
func stop_ball():
	speed = 0

func restart_ball():
	speed = 400
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-.8, .8][randi() % 2]
