extends Actor

var nearest_paddle_position = Vector2.ZERO
var default_speed = 400
var speed_multiplier = 0

var ball_speed_increment_value = 0

func _ready() -> void:
	match Settings.difficulty_setting:
		1:
			ball_speed_increment_value = 25
		2: 
			ball_speed_increment_value = 30
		3:
			ball_speed_increment_value = 55
		_:
			pass
	
	speed_multiplier = default_speed
	_velocity.x = -350
	_velocity.y = 0

func _physics_process(delta: float) -> void:
	#if off-screen vertically, invert vertical movement
	_velocity.y = - _velocity.y if position.y < 0 or position.y > 720 else _velocity.y
	#calculate velocity
	_velocity = calculate_velocity(_velocity, delta)
	#move
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

#velocity goes in, velocity comes out, don't ask
func calculate_velocity(_velocity: Vector2, delta: float)->Vector2:
	_velocity.x = _velocity.x + delta
	_velocity.y = _velocity.y + delta
	return _velocity

#on collision with paddle, bounce
func _on_HitBox_area_entered(area: Area2D) -> void:
	_velocity = calculate_bounce_angle(nearest_paddle_position, position)
	_velocity *= speed_multiplier
	speed_multiplier += ball_speed_increment_value
#	print("ball collide")

#cancel movement, move to the centre of the screen
func reset_position()->void:
	_velocity = Vector2.ZERO
	position = Vector2(540, 360)
#	print("PLAY STOPPED ball position reset")

#pick left or right, move in that direction
func resume_play()->void:
#	print("PLAY RESUMED")
	speed_multiplier = default_speed
	_velocity.x = rand_range(-10, 10)
	if(_velocity.x > 0):
		_velocity.x = default_speed
	else:
		_velocity.x = -default_speed
	_velocity.y = 0


func calculate_bounce_angle(paddle_position: Vector2, ball_position: Vector2) -> Vector2:
	#get the top of the paddle
	var top_of_paddle = paddle_position
	top_of_paddle.y -= 75
	
	#bounce angle is determined by the distance from the top of the paddle to the balls impact point on the paddle body
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

