extends Actor

var nearest_paddle_position = Vector2.ZERO

func _ready() -> void:
	speed_multiplier = 400
	speed.x = -350
	speed.y = 0

func _physics_process(delta: float) -> void:
	#if off-screen vertically, invert vertical movement
	speed.y = - speed.y if position.y < 0 or position.y > 720 else speed.y
	#calculate velocity
	_velocity = calculate_velocity(speed, delta)
	#move
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

#my functions
func calculate_velocity(speed: Vector2, delta: float)->Vector2:
	_velocity.x = speed.x + delta
	_velocity.y = speed.y + delta
	return _velocity

func get_nearest_paddle_position(paddle_position: Vector2)-> void:
	nearest_paddle_position = paddle_position

func calculate_bounce_angle(paddle_position: Vector2, ball_position: Vector2) -> Vector2:
	var top_of_paddle = paddle_position
	top_of_paddle.y -= 75
	
	#bounce angle is determined by the distance from the top of the paddle
	var bounce_angle = (top_of_paddle.distance_to(ball_position) * 0.75) + 40
	#print("bounce angle: ", bounce_angle)
	#convert to radians
	bounce_angle = deg2rad(bounce_angle)
	#convert bounce angle to normalised vector
	var direction = Vector2(cos(bounce_angle), sin(bounce_angle))
	
	#bounce angle needs to be rotated 90 degrees  anti-clockwise, not quite sure why
	var temp_x = direction.x
	var temp_y = direction.y
	#rotate direction 90 degrees anti-clockwise
	direction.x = temp_y
	direction.y = temp_x
	
	#invert y to compensate for godot's inverted y axis
	direction.y *= -1
	
	#invert x
	if(top_of_paddle.x > ball_position.x):
		direction.x *= -1
	
	
	return direction

#on collision with paddle, bounce
func _on_HitBox_area_entered(area: Area2D) -> void:
	speed = calculate_bounce_angle(nearest_paddle_position, position)
	speed *= speed_multiplier
	print("ball collide")

func _on_scoreArea_area_entered(area: Area2D) -> void:
	pass

func reset_position()->void:
	speed = Vector2.ZERO
	position = Vector2(540, 360)
	print("PLAY STOPPED ball position reset")

func resume_play()->void:
	print("PLAY RESUMED")
	speed.x = rand_range(-10, 10)
	if(speed.x > 0):
		speed.x = 400
	else:
		speed.x = -400
	speed.y = 0


