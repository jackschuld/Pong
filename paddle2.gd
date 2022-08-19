extends KinematicBody2D

var speed = 500
var ball

func _ready():
	ball = get_parent().find_node("ball")
	
func _physics_process(delta):
	if position.y > 64 and position.y < 530:
		yield(get_tree().create_timer(.15), "timeout")
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0

