extends KinematicBody2D

var speed = 500

func _physics_process(delta):
		if Input.is_action_pressed("p1_up") and global_position.y > 60:
			#move up
			move_local_y(-speed * delta)
		if Input.is_action_pressed("p1_down") and global_position.y < 536:
			move_local_y(speed * delta)
