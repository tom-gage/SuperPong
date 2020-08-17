extends Actor

var ball_position = Vector2.ZERO
var desired_position = 0
var direction = Vector2.ZERO

func _ready() -> void:
	speed = Vector2(100, -100)

func _process(delta: float) -> void:
	#position.y = ball_position.y
	pass

func _physics_process(delta: float) -> void:
	var direction = get_movement_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	#keep paddle on-screen
	position.y = clamp(position.y, 0 + 79, 720 - 79)



func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2
	) -> Vector2:
		var move_velocity = linear_velocity
		
		move_velocity.x = speed.x * direction.x
		move_velocity.y = speed.y * direction.y
		
		return move_velocity

func get_movement_direction()->Vector2:
	if(ball_position.y < position.y):
		return Vector2(0, 1)
	else:
		return Vector2(0, -1)

func get_ball_position(balls_current_position: Vector2) -> void:
	ball_position = balls_current_position

func reset_position()->void:
	position = Vector2(1055, 360)

func go_to_range(target_pos: Vector2, difficulty_multiplier: int)->void:
	pass
