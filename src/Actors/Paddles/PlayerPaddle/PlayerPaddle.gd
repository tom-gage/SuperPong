extends Actor

var current_speed = Vector2.ZERO

func _ready() -> void:
	speed = Vector2(400, -400)


func _physics_process(delta: float) -> void:
	var direction = get_movement_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	#keep paddle on-screen
	position.y = clamp(position.y, 0 + 79, 720 - 79)


func get_movement_direction() -> Vector2:
	return Vector2(
		0,
		Input.get_action_strength("paddle_up") - Input.get_action_strength("paddle_down")
	)

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
		var move_velocity = linear_velocity
		
		move_velocity = speed * direction
		
		current_speed = lerp(current_speed, move_velocity, 0.2)
		return current_speed
		
		#return move_velocity

func reset_position()->void:
	position = Vector2(25, 360)
